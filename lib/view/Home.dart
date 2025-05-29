import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mytodo/contollers/personneController.dart';
import 'package:mytodo/model/personne.dart';
import 'package:mytodo/theme/appSpacing.dart';
import 'package:mytodo/theme/themeController.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final utilisateur = Get.find<PersonneController>();
  final Themecontroller themeController = Get.find();
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
                              ? Theme.of(context).primaryColorDark
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
                  child: Icon(
                    Icons.calendar_month,
                    size: 22,
                    color: Theme.of(context).iconTheme.color,
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
                  child: Icon(
                    Icons.notifications_outlined,
                    size: 22,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
                15.hSpace,
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(child: Center(child: Text('Hello'))),
      ),
    );
  }
}
