import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Themecontroller extends GetxController {
  Rx<ThemeMode> themeMode = ThemeMode.light.obs;
  void switchTheme() {
    themeMode.value =
        themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    Get.changeThemeMode(themeMode.value);
  }
}
