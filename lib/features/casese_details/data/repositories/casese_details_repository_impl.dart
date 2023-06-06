

import 'package:dartz/dartz.dart';
import 'package:final_project1/features/attachments/domain/entities/attachment.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/casese_details.dart';
import '../../domain/repositories/casese_details_repositories.dart';
import '../dataSources/casese_details_local_data_source.dart';
import '../dataSources/casese_details_remote_data_source.dart';
import '../models/casese_details_model.dart';

class Casese_detailsRepositoryImpl implements Casese_detailsRepository {
  final CaseseDetailsRemoteDataSource remoteDataSource;
  final Casese_detailsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  Casese_detailsRepositoryImpl(
      {required this.networkInfo,
        required this.remoteDataSource,
        required this.localDataSource});
  @override
  Future<Either<Failure, List<Casese_details>>> getAllCasese_details() async {
    if (await networkInfo.isConnected) {
      //we put await because the function in the future
      try {
        final remoteCasese_details = await remoteDataSource.getAllCasese_details();
        localDataSource.cacheCasese_details(remoteCasese_details);
        return Right(remoteCasese_details);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localCasese_details = await localDataSource.getCachedCasese_details();
        return Right(localCasese_details);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }




  @override
  Future<Either<Failure, Unit>> updateCasese_details(Casese_details casese_details) async {
    //here we recieved post entity,not post model,so we will convert from entity to model

    final Casese_detailsModel casese_detailsModel =
    Casese_detailsModel(
      id: casese_details.id,
      title: casese_details.title,
      facts: casese_details.facts,
      legal_discussion: casese_details.legal_discussion,
      id_cases: casese_details.id_cases,);
    return await _getMessage(() {
      return remoteDataSource.updateCasese_details(casese_detailsModel);
    });
  }

  Future<Either<Failure, Unit>> _getMessage(
      //here the function recieve a function and function return future of unit
      Future<Unit> Function() deleteOrUpdateOrAddCasese_details) async {
    if (await networkInfo.isConnected) {
      try {
        await deleteOrUpdateOrAddCasese_details(); //here i call the parameter function
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

}
