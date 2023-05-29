import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/task.dart';
import '../repositories/tasks_repositories.dart';

class GetAllTasksUsecase {
  late final TasksRepository repository;

  GetAllTasksUsecase(this.repository);

  Future<Either<Failure, List<Task1>>> call() async {
    return await repository.getAllTasks();
  }
}
