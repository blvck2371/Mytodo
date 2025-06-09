import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytodo/contollers/personneController.dart';
import 'package:mytodo/notifications/notificationSevices.dart';
import 'package:mytodo/theme/appTheme.dart';
import 'package:mytodo/theme/themeController.dart';
import 'package:mytodo/view/Home.dart';
//import 'package:mytodo/theme/themeController.dart';

void main() {
  Get.put(Themecontroller());
  Get.put(PersonneController());
  WidgetsFlutterBinding.ensureInitialized();
  NotificationServices().initNotification();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final Themecontroller themeController = Get.find();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TodoListapp',
      darkTheme: Apptheme.darkTheme,
      themeMode: themeController.themeMode.value,

      theme: Apptheme.LightTheme,
      home: const Home(),
    );
  }
}
