
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/case.dart';
import '../repositories/cases_repositories.dart';

class GetAllCasesUsecase {
  late final CasesRepository repository;
  GetAllCasesUsecase(this.repository);
  Future<Either<Failure, List<Case1>>> call() async {
    return await repository.getAllCases();
  }
}
