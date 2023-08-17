import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:task/core/errors/exceptions.dart';
import 'package:task/core/errors/failures.dart';
import 'package:task/core/languages/app_translations.dart';
import 'package:task/features/home_feature/data/models/articles_model.dart';
import 'package:task/features/home_feature/domain/repositories/base_home_repository.dart';

import '../../../../../core/network/network_info.dart';
import '../data_source/home_data_source.dart';

class HomeRespoitory implements BaseHomeRepository {
  final BaseHomeDataSource baseHomeDataSource;

  final NetworkInfo networkInfo;

  HomeRespoitory({
    required this.baseHomeDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<ArticlesModel>>> getAllArticlesNextWeb() async {
    if (await networkInfo.isConnected) {
      try {
        var articles = await baseHomeDataSource.getAllArticlesNextWeb();

        return Right(articles);
      } on InvalidException {
        return Left(InvalidFailure());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure(message: LocaleKeys.networkFailure.tr));
    }
  }

  @override
  Future<Either<Failure, List<ArticlesModel>>>
      getAllArticlesAssociatedPress() async {
    if (await networkInfo.isConnected) {
      try {
        var articles = await baseHomeDataSource.getAllArticlesAssociatedPress();

        return Right(articles);
      } on ServerException {
        return Left(ServerFailure());
      } on InvalidException {
        return Left(InvalidFailure());
      }
    } else {
      return Left(NetworkFailure(message: LocaleKeys.networkFailure.tr));
    }
  }
}
