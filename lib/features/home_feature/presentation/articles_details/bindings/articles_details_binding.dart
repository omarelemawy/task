import 'package:get/get.dart';

import '../controllers/articles_details_controller.dart';

class ArticlesDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArticlesDetailsController>(
      () => ArticlesDetailsController(),
    );
  }
}
