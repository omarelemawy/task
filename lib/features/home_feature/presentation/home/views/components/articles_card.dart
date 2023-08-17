import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task/core/routes/app_pages.dart';
import 'package:task/core/widgets/custom_cached_image.dart';
import 'package:task/core/widgets/custom_text.dart';
import 'package:task/features/home_feature/domain/entities/articles.dart';

class ArticlesCard extends StatelessWidget {
  ArticlesCard({super.key, required this.article});
  Articles article;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.articlesDetails,arguments: article);
      },
      child: Column(
        children: [
          CustomCachedNetworkImage(
            boxFit: BoxFit.fill,
            width: double.infinity,
            url: article.urlToImage,
            height: 180,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  article.title,
                  style: context.textTheme.headlineSmall!
                      .copyWith(color: Colors.grey[700], fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomText(
                  article.author,
                  style: context.textTheme.headlineSmall!
                      .copyWith(color: Colors.grey[400], fontSize: 14),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomText(
                      DateFormat('MMM d,y')
                          .format(DateTime.parse(article.publishedAt)),
                      style: context.textTheme.headlineSmall!
                          .copyWith(color: Colors.grey[400], fontSize: 14),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
