
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/casese_details.dart';
import '../repositories/casese_details_repositories.dart';

class GetAllCasese_detailsUsecase {
  late final Casese_detailsRepository repository;
  GetAllCasese_detailsUsecase(this.repository);
  Future<Either<Failure, List<Casese_details>>> call() async {
    return await repository.getAllCasese_details();
  }
}
