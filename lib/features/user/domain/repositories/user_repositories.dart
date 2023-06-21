
import 'package:dartz/dartz.dart';
import 'package:final_project1/features/user/domain/entities/User.dart';

import '../../../../core/error/failures.dart';

abstract class UserRepository {
  Future<Either<Failure, List<User1>>> getAllUsers();
  Future<Either<Failure, Unit>> updateUser(User1 user1);

}
