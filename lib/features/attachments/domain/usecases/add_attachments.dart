
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/attachment.dart';
import '../repositories/attachment_repositories.dart';

class AddAttachmentUsecase {
  final AttachmentRepository repository;
  AddAttachmentUsecase(this.repository);
  Future<Either<Failure, Unit>> call(Attachment attachment) async {
    return await repository.addAttachment(attachment);
  }
}
