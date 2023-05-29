
import 'package:dartz/dartz.dart';
import 'package:flutter/rendering.dart';

import '../../../../core/error/failures.dart';
import '../entities/attachment.dart';
import '../repositories/attachment_repositories.dart';

class UpdateAttachmentUsecase {
  final AttachmentRepository repository;
  UpdateAttachmentUsecase(this.repository);
  Future<Either<Failure, Unit>> call(Attachment attachment) async {
    return await repository.updateAttachment(attachment);
  }
}
