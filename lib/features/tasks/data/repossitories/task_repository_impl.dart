import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/task.dart';
import '../../domain/repositories/tasks_repositories.dart';
import '../dataSources/task_local_data_source.dart';
import '../dataSources/task_remote_data_source.dart';
import '../models/task_model.dart';

class TasksRepositoryImpl implements TasksRepository {
  final TaskRemoteDataSource remoteDataSource;
  final TaskLocalDataSource localDataSource;
  late final NetworkInfo networkInfo;

  TasksRepositoryImpl({required this.networkInfo,
    required this.remoteDataSource,
    required this.localDataSource});

  @override
  Future<Either<Failure, List<Task1>>> getAllTasks() async {
    if (await networkInfo.isConnected) {
      //we put await because the function in the future
      try {
        final remoteTasks = await remoteDataSource.getAllTasks();
        localDataSource.cacheTasks(remoteTasks);
        return Right(remoteTasks);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTasks = await localDataSource.getCachedTask();
        return Right(localTasks);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addTask(Task1 task) async {
    //here e recieved post entity,not post model,so we will convert from entity to model

    final TaskModel taskModel =
    TaskModel(task_name: task.task_name,
      id: task.id,
      type_id: task.type_id,
      description: task.description,
      start_date: task.start_date,
      end_date: task.end_date,
      status: task.status,
      status_value: task.status_value,
      user_first_name: task.user_first_name,
      user_last_name: task.user_last_name,
      case_number: task.case_number,
    );
    return await _getMessage(() {
      return remoteDataSource.addTask(taskModel);
    });
  }

  @override
  Future<Either<Failure, Unit>> deleteTask(int taskId) async {
    return await _getMessage(() {
      return remoteDataSource.deleteTask(taskId);
    });
  }

  @override
  Future<Either<Failure, Unit>> updateTask(Task1 task) async {
    //here we recieved post entity,not post model,so we will convert from entity to model

    final TaskModel taskModel =
    TaskModel(task_name: task.task_name,
        id: task.id,
        type_id: task.type_id,
        description: task.description,
        start_date: task.start_date,
      end_date: task.end_date,
      status: task.status,
      status_value: task.status_value,
      user_first_name: task.user_first_name,
      user_last_name: task.user_last_name,
      case_number: task.case_number,
    );
    return await _getMessage(() {
      return remoteDataSource.updateTask(taskModel);
    });
  }

  Future<Either<Failure, Unit>> _getMessage(
      //here the function recieve a function and function return future of unit
      Future<Unit> Function() deleteOrUpdateOrAddTask) async {
    if (await networkInfo.isConnected) {
      try {
        await deleteOrUpdateOrAddTask(); //here i call the parameter function
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

}
