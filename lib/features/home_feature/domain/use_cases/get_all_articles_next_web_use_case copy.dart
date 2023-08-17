import 'package:dartz/dartz.dart';
import 'package:task/features/home_feature/domain/entities/articles.dart';
import 'package:task/features/home_feature/domain/repositories/base_home_repository.dart';

import '../../../../core/errors/failures.dart';

class GetAllArticlesNextWebUseCase {
  final BaseHomeRepository baseHomeRepository;

  GetAllArticlesNextWebUseCase({required this.baseHomeRepository});

  Future<Either<Failure, List<Articles>>> call() async {
    return await baseHomeRepository.getAllArticlesNextWeb();
  }
}
