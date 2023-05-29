

import 'package:dartz/dartz.dart';
import 'package:final_project1/features/attachments/domain/entities/attachment.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/User.dart';
import '../../domain/repositories/user_repositories.dart';
import '../dataSources/user_local_data_source.dart';
import '../dataSources/user_remote_data_source.dart';
import '../models/user_model.dart';

class UsersRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  UsersRepositoryImpl(
      {required this.networkInfo,
        required this.remoteDataSource,
        required this.localDataSource});
  @override
  Future<Either<Failure, List<User1>>> getAllUsers() async {
    if (await networkInfo.isConnected) {
      //we put await because the function in the future
      try {
        final remoteUsers = await remoteDataSource.getAllUsers();
        localDataSource.cacheUsers(remoteUsers);
        return Right(remoteUsers);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localUsers = await localDataSource.getCachedUsers();
        return Right(localUsers);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }
  
  @override
  Future<Either<Failure, Unit>> updateUser(User1 user1) async {
    //here we recieved post entity,not post model,so we will convert from entity to model

    final UserModel userModel =
    UserModel( id: user1.id,
      first_name: user1.first_name,
      last_name: user1.last_name,
      mother_name: user1.mother_name,
      father_name: user1.father_name,
      birth_date: user1.birth_date,
      birth_place: user1.birth_place,
      email: user1.email,
      roles_name: user1.roles_name,
      Status: user1.Status,
      password: user1.password,
      
      phone: user1.phone,
      location: user1.location,
    );
    return await _getMessage(() {
      return remoteDataSource.updateUser(userModel);
    });
  }

  Future<Either<Failure, Unit>> _getMessage(
      //here the function recieve a function and function return future of unit
      Future<Unit> Function() deleteOrUpdateOrAddUser) async {
    if (await networkInfo.isConnected) {
      try {
        await deleteOrUpdateOrAddUser(); //here i call the parameter function
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

}
