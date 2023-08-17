import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/core/consts/assets.dart';
import 'package:task/core/widgets/custom_loading.dart';
import 'package:task/core/widgets/custom_text.dart';
import 'package:task/features/home_feature/presentation/drawer/views/drawer_view.dart';
import 'package:task/features/home_feature/presentation/home/controllers/home_controller.dart';
import 'package:task/features/home_feature/presentation/home/views/components/articles_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return CustomLoading(
          isLoading: controller.isLoading,
          widget: Scaffold(
            backgroundColor: Colors.grey[300],
            drawer: const DrawerView(),
            appBar: AppBar(
              centerTitle: false,
              backgroundColor: Colors.black,
              actions: [
                Image.asset(
                  Assets.search,
                  height: 20,
                  width: 20,
                ),
                const SizedBox(
                  width: 20,
                )
              ],
              title: CustomText("LINK DEVELOPMENT",
                  style: context.textTheme.headlineMedium!.copyWith(
                    color: Colors.white,
                  )),
            ),
            body: controller.articles == null
                ? const SizedBox()
                : ListView.separated(
                    padding: const EdgeInsets.all(20),
                    itemBuilder: (context, index) {
                      return ArticlesCard(
                        article: controller.articles![index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: controller.articles!.length),
          ),
        );
      },
    );
  }
}
