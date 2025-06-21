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
import 'firebase_options.dart';
//import 'package:mytodo/theme/themeController.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    
    // Initialisation des contrôleurs
    Get.put(Themecontroller());
    Get.put(PersonneController());
    
    // Initialisation des notifications
    await NotificationServices().initNotification();
    
    // Initialisation de Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Vérification de l'état de connexion
    final user = FirebaseAuth.instance.currentUser;
    
    runApp(MyApp(initialRoute: user != null ? '/home' : '/login'));
  } catch (e) {
    print('Erreur lors de l\'initialisation: $e');
    runApp(MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Erreur d\'initialisation: $e'),
        ),
      ),
    ));
  }
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  final Themecontroller themeController = Get.find();
  
  MyApp({super.key, required this.initialRoute});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TodoListapp',
      darkTheme: Apptheme.darkTheme,
      themeMode: themeController.themeMode.value,
      theme: Apptheme.LightTheme,
      initialRoute: initialRoute,
      getPages: [
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/home', page: () => const Home()),
      ],
    );
  }
}
