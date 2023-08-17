import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/core/consts/assets.dart';
import 'package:task/core/widgets/custom_text.dart';

class MyDrawerController extends GetxController {
  int selectedItem = 0;
  List drawerItems = [
    {"image": Assets.explore, "name": "Explore"},
    {"image": Assets.live, "name": "Live Chat"},
    {"image": Assets.gallery, "name": "Gallery"},
    {"image": Assets.wishlist, "name": "Wish List"},
    {"image": Assets.magazine, "name": "E-Magazine"},
  ];
  set setSelectedItem(int selected) {
    selectedItem = selected;
    Get.dialog(AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(40))),
      content: Container(
        height: Get.height / 3,
        width: Get.width / 1.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40), color: Colors.white),
        child: Center(child: CustomText(selctedNavegate())),
      ),
    ));
    update();
  }

  String selctedNavegate() {
    String result = drawerItems[0]["name"];
    switch (selectedItem) {
      case 0:
        result = drawerItems[0]["name"];
        break;
      case 1:
        result = drawerItems[1]["name"];
        break;
      case 2:
        result = drawerItems[2]["name"];
        break;
      case 3:
        result = drawerItems[3]["name"];
        break;

      case 4:
        result = drawerItems[4]["name"];
        break;
    }
    print(result);
    update();
    return result;
  }
}
