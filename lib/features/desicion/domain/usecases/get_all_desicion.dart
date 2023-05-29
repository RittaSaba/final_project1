
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/desicion.dart';
import '../repositories/desicion_repositories.dart';

class GetAllDesicionUsecase {
  late final DesicionRepository repository;
  GetAllDesicionUsecase(this.repository);
  Future<Either<Failure, List<Desicion>>> call() async {
    return await repository.getAllDesicion();
  }
}
