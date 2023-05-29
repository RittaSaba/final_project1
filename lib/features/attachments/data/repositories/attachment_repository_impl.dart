

import 'package:dartz/dartz.dart';
import 'package:final_project1/features/attachments/domain/entities/attachment.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/attachment_repositories.dart';
import '../dataSources/attachment_local_data_source.dart';
import '../dataSources/attachment_remote_data_source.dart';
import '../models/attachment_model.dart';

class AttachmentsRepositoryImpl implements AttachmentRepository {
  final AttachmentRemoteDataSource remoteDataSource;
  final AttachmentLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AttachmentsRepositoryImpl(
      {required this.networkInfo,
        required this.remoteDataSource,
        required this.localDataSource});
  @override
  Future<Either<Failure, List<Attachment>>> getAllAttachments() async {
    if (await networkInfo.isConnected) {
      //we put await because the function in the future
      try {
        final remoteAttachments = await remoteDataSource.getAllAttachments();
        localDataSource.cacheAttachments(remoteAttachments);
        return Right(remoteAttachments);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localAttachments = await localDataSource.getCachedAttachments();
        return Right(localAttachments);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addAttachment(Attachment attachment) async {
    //here e recieved post entity,not post model,so we will convert from entity to model

    final AttachmentModel attachmentModel = AttachmentModel(file_name: attachment.file_name,
        cases_number: attachment.cases_number,
        Created_by: attachment.Created_by,
        cases_id: attachment.cases_id);
    return await _getMessage(() {
      return remoteDataSource.addAttachment(attachmentModel);
    });
  }

  @override
  Future<Either<Failure, Unit>> deleteAttachment(int attachmentId) async {
    return await _getMessage(() {
      return remoteDataSource.deleteAttachment(attachmentId);
    });
  }

  @override
  Future<Either<Failure, Unit>> updateAttachment(Attachment attachment) async {
    //here we recieved post entity,not post model,so we will convert from entity to model

    final AttachmentModel attachmentModel =
    AttachmentModel( file_name: attachment.file_name,cases_number: attachment.cases_number,Created_by: attachment.Created_by,cases_id: attachment.cases_id);
    return await _getMessage(() {
      return remoteDataSource.updateAttachment(attachmentModel);
    });
  }

  Future<Either<Failure, Unit>> _getMessage(
      //here the function recieve a function and function return future of unit
      Future<Unit> Function() deleteOrUpdateOrAddAttachment) async {
    if (await networkInfo.isConnected) {
      try {
        await deleteOrUpdateOrAddAttachment(); //here i call the parameter function
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

}
