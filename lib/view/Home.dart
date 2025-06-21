import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mytodo/contollers/personneController.dart';
import 'package:mytodo/model/personne.dart';
import 'package:mytodo/model/tache.dart';
import 'package:mytodo/notifications/notificationSevices.dart';
import 'package:mytodo/theme/appSpacing.dart';
import 'package:mytodo/theme/themeController.dart';
import 'package:mytodo/theme/appColors.dart';
import 'package:mytodo/view/composant/CompletedTask.dart';
import 'package:mytodo/view/composant/Menuetat.dart';
import 'package:mytodo/view/composant/bottomshet.dart';
import 'package:mytodo/view/composant/onProgress.dart';
import 'package:mytodo/view/task_scheduler_view.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mytodo/view/Loginpage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final utilisateur = Get.find<PersonneController>();
  final Themecontroller themeController = Get.find();
  final RxList<Tache> tachesEnCours = <Tache>[].obs;
  final RxList<Tache> tachesAchevees = <Tache>[].obs;

  @override
  void initState() {
    super.initState();
    _loadTaches();
  }

  void _loadTaches() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Écouter les tâches en cours
      Tache.getTachesByStatus(user.uid, user.email!, TacheStatus.enCours)
          .listen((taches) {
        tachesEnCours.value = taches;
      });

      // Écouter les tâches achevées
      Tache.getTachesByStatus(user.uid, user.email!, TacheStatus.achevee)
          .listen((taches) {
        tachesAchevees.value = taches;
      });
    }
  }

  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginPage());
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erreur lors de la déconnexion: $e'),
          backgroundColor: Appcolors.errorColor,
        ),
      );
    }
  }

  void _showAboutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(
          'À propos',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'MyTodo App',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Version 1.0.0',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Une application de gestion de tâches simple et efficace.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Fermer',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        leading: PopupMenuButton<String>(
          icon: Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Icon(
              Icons.person,
              size: 30,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          onSelected: (value) {
            switch (value) {
              case 'profile':
                // TODO: Naviguer vers la page de profil
                break;
              case 'about':
                _showAboutDialog();
                break;
              case 'logout':
                _signOut();
                break;
            }
          },
          itemBuilder: (BuildContext context) => [
            PopupMenuItem<String>(
              value: 'profile',
              child: Row(
                children: [
                  Icon(
                    Icons.person_outline,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Mon profil',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
            PopupMenuItem<String>(
              value: 'about',
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'À propos',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
            PopupMenuItem<String>(
              value: 'logout',
              child: Row(
                children: [
                  Icon(
                    Icons.logout,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Déconnexioner',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        title: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello, ",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  "${utilisateur.personne.value.nom} ${utilisateur.personne.value.prenom}",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.surface,
            ),
            child: IconButton(
              onPressed: () {
                Get.find<Themecontroller>().switchTheme();
              },
              icon: Icon(
                Icons.light_mode_outlined,
                size: 22,
                color: themeController.themeMode.value == ThemeMode.light
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          2.hSpace,
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.surface,
            ),
            child: IconButton(
              onPressed: () {
                Get.to(TaskSchedulerView());
              },
              icon: Icon(
                Icons.calendar_month,
                size: 22,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          2.hSpace,
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.surface,
            ),
            child: IconButton(
              icon: Icon(
                Icons.notifications_outlined,
                size: 22,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              onPressed: () async {
                final status = await Permission.notification.status;

                if (status.isGranted) {
                  NotificationServices().showNotification(
                    title: 'My Todo',
                    body: 'Tâche à effectuer.....',
                  );
                } else {
                  final newStatus = await Permission.notification.request();

                  if (newStatus.isGranted) {
                    NotificationServices().showNotification(
                      title: 'My Todo',
                      body: 'Tâche à effectuer.....',
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Notification refusée. Activez-la dans les paramètres.',
                        ),
                        backgroundColor: Appcolors.errorColor,
                      ),
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Theme.of(context).appBarTheme.backgroundColor,
              child: MenuEtat(menu: "En Cours", nombre: tachesEnCours.length.toString()),
            ),
            2.vSpace,
            Container(
              margin: EdgeInsets.only(
                left: AppSpacing.sm,
                right: AppSpacing.sm,
              ),
              child: Obx(() => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...tachesEnCours.map((tache) => Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: OnProgress(taches: tache),
                    )).toList(),
                  ],
                ),
              )),
            ),

            10.vSpace,
            Container(
              color: Theme.of(context).appBarTheme.backgroundColor,
              child: MenuEtat(menu: "Achevé", nombre: tachesAchevees.length.toString()),
            ),

            10.vSpace,
            Container(
              margin: EdgeInsets.only(
                left: AppSpacing.sm,
                right: AppSpacing.sm,
              ),
              child: Obx(() => Column(
                children: [
                  ...tachesAchevees.map((tache) => Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: CompletedTask(taches: tache),
                  )).toList(),
                ],
              )),
            ),
          ],
        ),
      ),

      floatingActionButton: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,

          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              offset: Offset(0, 6), // Décalage de l'ombre vers le bas
              blurRadius: 10,
            ),
          ],
        ),
        child: IconButton(
          icon: Icon(Icons.add, color: Colors.white),
          onPressed: () {
            showNewTaskModal(context);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
