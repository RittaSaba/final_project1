
import 'package:dartz/dartz.dart';
import 'package:flutter/rendering.dart';

import '../../../../core/error/failures.dart';
import '../entities/User.dart';
import '../repositories/user_repositories.dart';
class UpdateUserUsecase {
  final UserRepository repository;
  UpdateUserUsecase(this.repository);
  Future<Either<Failure, Unit>> call(User1 user1) async {
    return await repository.updateUser(user1);
  }
}
