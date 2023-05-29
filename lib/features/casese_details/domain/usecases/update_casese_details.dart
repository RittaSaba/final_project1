
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/casese_details.dart';
import '../repositories/casese_details_repositories.dart';

class UpdateCasese_detailsUsecase {
  final Casese_detailsRepository repository;
  UpdateCasese_detailsUsecase(this.repository);
  Future<Either<Failure, Unit>> call(Casese_details casese_details) async {
    return await repository.updateCasese_details(casese_details);
  }
}
