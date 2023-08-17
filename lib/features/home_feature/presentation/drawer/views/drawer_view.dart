import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/core/consts/assets.dart';
import 'package:task/core/widgets/custom_text.dart';
import 'package:task/features/home_feature/presentation/drawer/controllers/drawer_controller.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyDrawerController>(
      init: MyDrawerController(),
      builder: (controller) {
        return Drawer(
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    Assets.profile,
                    height: 70,
                    width: 70,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        "Welcome",
                        style: context.textTheme.headlineSmall!
                            .copyWith(color: Colors.grey[600]),
                      ),
                      CustomText(
                        "Tony Roshdy",
                        style: context.textTheme.headlineSmall!
                            .copyWith(color: Colors.black, fontSize: 20),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Image.asset(
                    Assets.arrow,
                    height: 30,
                    width: 30,
                    color: Colors.grey[700],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.drawerItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        controller.setSelectedItem = index;
                      },
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      leading: controller.selectedItem == index
                          ? Image.asset(Assets.selected)
                          : const SizedBox(),
                      title: Row(
                        children: [
                          Image.asset(
                            controller.drawerItems[index]["image"],
                            height: 25,
                            width: 25,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          CustomText(
                            controller.drawerItems[index]["name"],
                            style: context.textTheme.headlineSmall!
                                .copyWith(color: Colors.black, fontSize: 18),
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
