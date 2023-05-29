
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/desicion.dart';

abstract class DesicionRepository {
  Future<Either<Failure, List<Desicion>>> getAllDesicion();
  Future<Either<Failure, Unit>> updateDesicion(Desicion desicion);

}
