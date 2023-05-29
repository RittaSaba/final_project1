
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/attachment.dart';
import '../repositories/attachment_repositories.dart';

class GetAllAttachmentsUsecase {
  late final AttachmentRepository repository;
  GetAllAttachmentsUsecase(this.repository);
  Future<Either<Failure, List<Attachment>>> call() async {
    return await repository.getAllAttachments();
  }
}
