import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/task.dart';
import '../repositories/tasks_repositories.dart';

class AddTaskUsecase {
  final TasksRepository repository;

  AddTaskUsecase(this.repository);

  Future<Either<Failure, Unit>> call(Task1 task) async {
    return await repository.addTask(task);
  }
}
