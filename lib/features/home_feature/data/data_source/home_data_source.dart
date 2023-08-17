import 'package:get/get.dart';
import 'package:task/core/consts/api_urls.dart';
import 'package:task/core/errors/exceptions.dart';
import 'package:task/features/home_feature/data/models/articles_model.dart';

abstract class BaseHomeDataSource {
  Future<List<ArticlesModel>> getAllArticlesNextWeb();
  Future<List<ArticlesModel>> getAllArticlesAssociatedPress();
}

class HomeDataSource extends GetConnect implements BaseHomeDataSource {
  @override
  Future<List<ArticlesModel>> getAllArticlesNextWeb() async {
    Response response = await get(
      "${ApiUrls.articles}?source=the-next-web&apiKey=${ApiUrls.apiKey}",
      headers: ApiUrls.getHeaders(),
    );

    print("===========>${response.statusCode}");

    switch (response.statusCode) {
      case 200:
        return (response.body['articles'] as List)
            .map((e) => ArticlesModel.fromMap(e))
            .toList();

      case 401:
        throw InvalidException();

      default:
        throw ServerException();
    }
  }

  @override
  Future<List<ArticlesModel>> getAllArticlesAssociatedPress() async {
    Response response = await get(
      "${ApiUrls.articles}?source=associated-press&apiKey=${ApiUrls.apiKey}",
      headers: ApiUrls.getHeaders(),
    );

    print("===========>${response.body}");

    switch (response.statusCode) {
      case 200:
        return (response.body['articles'] as List)
            .map((e) => ArticlesModel.fromMap(e))
            .toList();
      case 401:
        throw InvalidException();

      default:
        throw ServerException();
    }
  }
}
