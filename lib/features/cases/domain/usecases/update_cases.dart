
import 'package:dartz/dartz.dart';
import 'package:flutter/rendering.dart';

import '../../../../core/error/failures.dart';
import '../entities/case.dart';
import '../repositories/cases_repositories.dart';

class UpdateCasesUsecase {
  final CasesRepository repository;
  UpdateCasesUsecase(this.repository);
  Future<Either<Failure, Unit>> call(Case1 case1) async {
    return await repository.updateCase(case1);
  }
}
