import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:task/features/home_feature/presentation/articles_details/bindings/articles_details_binding.dart';
import 'package:task/features/home_feature/presentation/articles_details/views/articles_details_view.dart';
import 'package:task/features/home_feature/presentation/home/bindings/home_binding.dart';
import 'package:task/features/home_feature/presentation/home/views/home_view.dart';
import 'package:task/features/home_feature/presentation/splash/bindings/splash_binding.dart';
import 'package:task/features/home_feature/presentation/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.articlesDetails,
      page: () => const ArticlesDetailsView(),
      binding: ArticlesDetailsBinding(),
    ),
  ];
}
