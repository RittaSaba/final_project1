

import 'package:dartz/dartz.dart';
import 'package:final_project1/features/attachments/domain/entities/attachment.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/case.dart';
import '../../domain/repositories/cases_repositories.dart';
import '../dataSources/case_local_data_source.dart';
import '../dataSources/case_remote_data_source.dart';
import '../models/case_model.dart';

class CaseRepositoryImpl implements CasesRepository {
  final CaseRemoteDataSource remoteDataSource;
  final CaseLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  CaseRepositoryImpl(
      {required this.networkInfo,
        required this.remoteDataSource,
        required this.localDataSource});





  @override
  Future<Either<Failure, Unit>> updateCase(Case1 case1) async {
    //here we recieved post entity,not post model,so we will convert from entity to model

    final CaseModel caseModel =
    CaseModel( id:case1.id,court_id:case1.court_id,case_room:case1.case_room,Status:case1.Status,title:case1.title,Value_Status:case1.Value_Status);
    return await _getMessage(() {
      return remoteDataSource.updateCase(caseModel);
    });
  }

  Future<Either<Failure, Unit>> _getMessage(
      //here the function recieve a function and function return future of unit
      Future<Unit> Function() deleteOrUpdateOrAddCase) async {
    if (await networkInfo.isConnected) {
      try {
        await deleteOrUpdateOrAddCase(); //here i call the parameter function
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<Case1>>> getAllCases() async {
    if (await networkInfo.isConnected) {
      //we put await because the function in the future
      try {
        final remoteCase = await remoteDataSource.getAllCase();
        localDataSource.cacheCase(remoteCase);
        return Right(remoteCase);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localCase = await localDataSource.getCachedCase();
        return Right(localCase);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

}
