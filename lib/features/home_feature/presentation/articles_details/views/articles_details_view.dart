import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task/core/consts/assets.dart';
import 'package:task/core/widgets/custom_button.dart';
import 'package:task/core/widgets/custom_cached_image.dart';
import 'package:task/core/widgets/custom_text.dart';
import 'package:task/features/home_feature/presentation/articles_details/controllers/articles_details_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticlesDetailsView extends StatelessWidget {
  const ArticlesDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArticlesDetailsController>(
      builder: (controller) {
        return Scaffold(
            backgroundColor: Colors.grey[300],
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
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Stack(
                    children: [
                      CustomCachedNetworkImage(
                        boxFit: BoxFit.fill,
                        width: double.infinity,
                        url: controller.article!.urlToImage,
                        height: 220,
                      ),
                      Positioned(
                        bottom: 30,
                        right: 10,
                        child: CustomText(
                          DateFormat('MMM d,y').format(
                              DateTime.parse(controller.article!.publishedAt)),
                          style: context.textTheme.headlineSmall!.copyWith(
                            color: Colors.grey[400],
                            fontSize: 14,
                            shadows: <Shadow>[
                              const Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 3.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                              const Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 8.0,
                                color: Color.fromARGB(125, 0, 0, 255),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    color: Colors.white,
                    child: Column(
                      children: [
                        CustomText(
                          controller.article!.title,
                          style: context.textTheme.headlineSmall!
                              .copyWith(color: Colors.grey[700], fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          controller.article!.author,
                          style: context.textTheme.headlineSmall!
                              .copyWith(color: Colors.grey[500], fontSize: 15),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomText(
                          controller.article!.description,
                          style: context.textTheme.headlineSmall!
                              .copyWith(color: Colors.grey[500], fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    onPressed: () {
                      launch(Uri.parse(controller.article!.url));
                    },
                    width: double.infinity,
                    borderRadius: 0,
                    height: 50,
                    color: Colors.black,
                    child: CustomText("OPEN WEBSITE",
                        style: context.textTheme.headlineSmall!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 16)),
                  )
                ],
              ),
            ));
      },
    );
  }
}

Future<void> launch(url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
