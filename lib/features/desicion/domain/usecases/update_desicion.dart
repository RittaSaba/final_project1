
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/desicion.dart';
import '../repositories/desicion_repositories.dart';

class UpdateDesicionUsecase {
  final DesicionRepository repository;
  UpdateDesicionUsecase(this.repository);
  Future<Either<Failure, Unit>> call(Desicion desicion) async {
    return await repository.updateDesicion(desicion);
  }
}
