import 'package:dartz/dartz.dart';
import 'package:flutter/rendering.dart';

import '../../../../core/error/failures.dart';
import '../entities/task.dart';
import '../repositories/tasks_repositories.dart';

class UpdateTaskUsecase {
  final TasksRepository repository;

  UpdateTaskUsecase(this.repository);

  Future<Either<Failure, Unit>> call(Task1 task) async {
    return await repository.updateTask(task);
  }
}
