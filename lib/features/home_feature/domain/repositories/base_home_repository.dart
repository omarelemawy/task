import 'package:dartz/dartz.dart';
import 'package:task/core/errors/failures.dart';
import 'package:task/features/home_feature/domain/entities/articles.dart';

abstract class BaseHomeRepository {
  Future<Either<Failure, List<Articles>>> getAllArticlesNextWeb();
  Future<Either<Failure, List<Articles>>> getAllArticlesAssociatedPress();
}
