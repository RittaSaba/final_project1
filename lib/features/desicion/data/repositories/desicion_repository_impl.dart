

import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/desicion.dart';
import '../../domain/repositories/desicion_repositories.dart';
import '../dataSources/desicion_local_data_source.dart';
import '../dataSources/desicion_remote_data_source.dart';
import '../models/desicion_model.dart';

class DesicionRepositoryImpl implements DesicionRepository {
  final DesicionRemoteDataSource remoteDataSource;
  final DesicionLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  DesicionRepositoryImpl(
      {required this.networkInfo,
        required this.remoteDataSource,
        required this.localDataSource});
  @override
  Future<Either<Failure, List<Desicion>>> getAllDesicion() async {
    if (await networkInfo.isConnected) {
      //we put await because the function in the future
      try {
        final remoteDesicion= await remoteDataSource.getAllDesicion();
        localDataSource.cacheDesicion(remoteDesicion);
        return Right(remoteDesicion);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localDesicion = await localDataSource.getCachedDesicion();
        return Right(localDesicion);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }




  @override
  Future<Either<Failure, Unit>> updateDesicion(Desicion desicion) async {
    //here we recieved post entity,not post model,so we will convert from entity to model

    final DesicionModel desicionModel =
    DesicionModel(
      id: desicion.id,
      number: desicion.number,
      description: desicion.description,
      case_id: desicion.case_id,
      date: desicion.date,

    );
    return await _getMessage(() {
      return remoteDataSource.updateDesicion(desicionModel);
    });
  }

  Future<Either<Failure, Unit>> _getMessage(
      //here the function recieve a function and function return future of unit
      Future<Unit> Function() deleteOrUpdateOrAddDesicion) async {
    if (await networkInfo.isConnected) {
      try {
        await deleteOrUpdateOrAddDesicion(); //here i call the parameter function
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

}
