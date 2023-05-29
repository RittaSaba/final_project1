
import 'package:dartz/dartz.dart';
import 'package:final_project1/features/attachments/domain/entities/attachment.dart';

import '../../../../core/error/failures.dart';

abstract class AttachmentRepository {
  Future<Either<Failure, List<Attachment>>> getAllAttachments();
  Future<Either<Failure, Unit>> deleteAttachment(int id);
  Future<Either<Failure, Unit>> updateAttachment(Attachment attachment);
  Future<Either<Failure, Unit>> addAttachment(Attachment attachment);
}
