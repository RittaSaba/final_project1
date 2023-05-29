
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/casese_details.dart';

abstract class Casese_detailsRepository {
  Future<Either<Failure, List<Casese_details>>> getAllCasese_details();
  Future<Either<Failure, Unit>> updateCasese_details(Casese_details casese_details);

}
