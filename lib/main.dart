import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytodo/contollers/personneController.dart';
import 'package:mytodo/notifications/notificationSevices.dart';
import 'package:mytodo/theme/appTheme.dart';
import 'package:mytodo/theme/themeController.dart';
import 'package:mytodo/view/Home.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mytodo/view/Loginpage.dart';
//import 'package:mytodo/theme/themeController.dart';

void main() async {
  Get.put(Themecontroller());
  Get.put(PersonneController());
  WidgetsFlutterBinding.ensureInitialized();
  NotificationServices().initNotification();
  await Firebase.initializeApp();
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
      home: const LoginPage(),
    );
  }
}
