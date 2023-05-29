
import 'package:dartz/dartz.dart';
import 'package:final_project1/features/cases/domain/entities/case.dart';

import '../../../../core/error/failures.dart';

abstract class CasesRepository {
  Future<Either<Failure, List<Case1>>> getAllCases();

  Future<Either<Failure, Unit>> updateCase(Case1 case1);

}
