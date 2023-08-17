import 'package:get/get.dart';
import 'package:task/features/home_feature/domain/entities/articles.dart';

class ArticlesDetailsController extends GetxController {
  Articles? article;
  @override
  void onInit() {
    article = Get.arguments;

    super.onInit();
  }
}
