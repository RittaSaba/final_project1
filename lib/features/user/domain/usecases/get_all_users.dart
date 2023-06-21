
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/User.dart';
import '../repositories/user_repositories.dart';
class GetAllUsersUsecase {
  late final UserRepository repository;
  GetAllUsersUsecase(this.repository);
  Future<Either<Failure, List<User1>>> call() async {
    return await repository.getAllUsers();
  }
}
