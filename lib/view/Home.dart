import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mytodo/contollers/personneController.dart';
import 'package:mytodo/model/personne.dart';
import 'package:mytodo/model/tache.dart';
import 'package:mytodo/notifications/notificationSevices.dart';
import 'package:mytodo/theme/appSpacing.dart';
import 'package:mytodo/theme/themeController.dart';
import 'package:mytodo/view/composant/CompletedTask.dart';
import 'package:mytodo/view/composant/Menuetat.dart';
import 'package:mytodo/view/composant/bottomshet.dart';
import 'package:mytodo/view/composant/onProgress.dart';
import 'package:mytodo/view/task_scheduler_view.dart';
import 'package:permission_handler/permission_handler.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final utilisateur = Get.find<PersonneController>();
  final Themecontroller themeController = Get.find();

  //hhhhhhhhhhhhhh

  //jjjjjjjjjjjjjjjj
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //affichage du profile de l'utilisateur
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 42,
              width: 42,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              child: Icon(
                Icons.person,
                size: 30,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ],
        ),

        //afffichage du nom
        title: Row(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "Hello, ",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),

                  Container(
                    child: Text(
                      "${utilisateur.personne.value.nom}" +
                          " " +
                          "${utilisateur.personne.value.prenom}",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        //affichage du profile de lutilisateur
        actions: [
          Container(
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Get.find<Themecontroller>().switchTheme();
                    },
                    icon: Icon(
                      Icons.light_mode_outlined,
                      size: 22,
                      color:
                          themeController.themeMode.value == ThemeMode.light
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorLight,
                    ),
                  ),
                ),
                //ampoule
                2.hSpace,
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Get.to(TaskSchedulerView());
                    },
                    icon: Icon(
                      Icons.calendar_month,
                      size: 22,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ),

                2.hSpace,

                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.notifications_outlined,
                      size: 22,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    onPressed: () async {
                      final status = await Permission.notification.status;

                      if (status.isGranted) {
                        // Permission déjà accordée
                        NotificationServices().showNotification(
                          title: 'My Todo',
                          body: 'Tâche à effectuer.....',
                        );
                      } else {
                        // Demander la permission
                        final newStatus =
                            await Permission.notification.request();

                        if (newStatus.isGranted) {
                          NotificationServices().showNotification(
                            title: 'My Todo',
                            body: 'Tâche à effectuer.....',
                          );
                        } else {
                          // Optionnel : montrer un message ou rediriger vers les paramètres
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Notification refusée. Activez-la dans les paramètres.',
                              ),
                            ),
                          );
                        }
                      }
                    },
                  ),
                ),
                15.hSpace,
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // colone pour tout
          children: [
            Container(
              color: Theme.of(context).appBarTheme.backgroundColor,

              child: MenuEtat(menu: "En Cours", nombre: "17"),
            ),
            2.vSpace,
            // on progress
            Container(
              margin: EdgeInsets.only(
                left: AppSpacing.sm,
                right: AppSpacing.sm,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    OnProgress(taches: Tache()),
                    20.hSpace,
                    OnProgress(taches: Tache()),
                    20.hSpace,

                    OnProgress(taches: Tache()),
                    20.hSpace,

                    OnProgress(taches: Tache()),
                  ],
                ),
              ),
            ),

            //end on progree

            //achevé
            10.vSpace,
            Container(
              color: Theme.of(context).appBarTheme.backgroundColor,

              child: MenuEtat(menu: "Achevé", nombre: "54"),
            ),

            10.vSpace,
            Container(
              margin: EdgeInsets.only(
                left: AppSpacing.sm,
                right: AppSpacing.sm,
              ),

              child: Column(
                children: [
                  CompletedTask(taches: Tache()),
                  5.vSpace,
                  CompletedTask(taches: Tache()),
                  5.vSpace,
                  CompletedTask(taches: Tache()),
                  5.vSpace,
                  CompletedTask(taches: Tache()),
                ],
              ),
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
              offset: Offset(0, 6), // Décalage de l’ombre vers le bas
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

      //  FloatingActionButton(

      //   backgroundColor: const Color.fromARGB(255, 113, 165, 255),
      //   onPressed: () {},
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Icon(Icons.add),
      //       Container(child: Text("Creer un Nouveau")),
      //     ],
      //   ),
      // ),
    );
  }
}
