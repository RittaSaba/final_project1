import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/tasks_repositories.dart';

class DeleteTaskUsecase {
  final TasksRepository repository;

  DeleteTaskUsecase(this.repository);

  Future<Either<Failure, Unit>> call(int taskId) async {
    return await repository.deleteTask(taskId);
  }
}
