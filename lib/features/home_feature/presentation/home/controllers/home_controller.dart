import 'package:get/get.dart';
import 'package:task/core/utils/utils.dart';
import 'package:task/features/home_feature/domain/entities/articles.dart';
import 'package:task/features/home_feature/domain/use_cases/get_all_articles_next_web_use_case%20copy.dart';
import 'package:task/features/home_feature/domain/use_cases/get_articles_associated_press_use_case.dart';

class HomeController extends GetxController {
  GetAllArticlesAssociatedPressUseCase1 getAllArticlesAssociatedPressUseCase1;
  GetAllArticlesNextWebUseCase getAllArticlesNextWebUseCase;
  HomeController({
    required this.getAllArticlesAssociatedPressUseCase1,
    required this.getAllArticlesNextWebUseCase,
  });

  List<Articles> articles = [];
  bool isLoading = false;
  void getAllArticles() async {
    isLoading = true;
    update();

    var addAddress = await getAllArticlesAssociatedPressUseCase1();

    addAddress.fold((failure) {
      isLoading = false;
      update();
      print(failure);
      Utils.showError(Utils.mapFailureToMessage(failure));
    }, (result) {
      articles.addAll(result);
      isLoading = false;
      update();
    });
  }

  void getAllArticlesNextWeb() async {
    isLoading = true;
    update();

    var addAddress = await getAllArticlesNextWebUseCase();

    addAddress.fold((failure) {
      isLoading = false;
      update();
      print(failure);
      Utils.showError(Utils.mapFailureToMessage(failure));
    }, (result) {
      articles.addAll(result);

      isLoading = false;
      update();
    });
  }

  @override
  void onInit() async {
    getAllArticles();
    getAllArticlesNextWeb();
    super.onInit();
  }
}
