
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/task.dart';

abstract class TasksRepository {
  Future<Either<Failure, List<Task1>>> getAllTasks();

  Future<Either<Failure, Unit>> updateTask(Task1 task);

  Future<Either<Failure, Unit>> deleteTask(int id);

  Future<Either<Failure, Unit>> addTask(Task1 task);

}
