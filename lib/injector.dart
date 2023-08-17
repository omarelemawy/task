import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:task/features/home_feature/data/data_source/home_data_source.dart';
import 'package:task/features/home_feature/domain/repositories/base_home_repository.dart';
import 'package:task/features/home_feature/domain/use_cases/get_all_articles_next_web_use_case%20copy.dart';
import 'package:task/features/home_feature/domain/use_cases/get_articles_associated_press_use_case.dart';

import 'core/network/network_info.dart';
import 'core/services/internet_connection_service.dart';
import 'features/home_feature/data/repositories/home_repository.dart';

Future<void> init() async {
  //! External

  final internetConnectionChecker = InternetConnectionChecker();

  Get.lazyPut(
    () => internetConnectionChecker,
    fenix: true,
  );

  //! Core
  Get.lazyPut<NetworkInfo>(
    () => NetworkInfoImpl(
      internetConnectionChecker: Get.find(),
    ),
    fenix: true,
  );

  ///--------------------------- AUTH FEATURE ----------------------------------

  // Data sources

  Get.lazyPut<BaseHomeDataSource>(
    () => HomeDataSource(),
    fenix: true,
  );

  // Repository
  Get.lazyPut<BaseHomeRepository>(
    () => HomeRespoitory(
      baseHomeDataSource: Get.find(),
      networkInfo: Get.find(),
    ),
    fenix: true,
  );

  // Use cases

  Get.lazyPut(
    () => GetAllArticlesAssociatedPressUseCase1(baseHomeRepository: Get.find()),
    fenix: true,
  );
  Get.lazyPut(
    () => GetAllArticlesNextWebUseCase(baseHomeRepository: Get.find()),
    fenix: true,
  );

  ///--------------------------- SERVICES --------------------------------------

  await Get.putAsync(() => InternetConnectionService(
        networkInfo: Get.find(),
      ).init());
}
