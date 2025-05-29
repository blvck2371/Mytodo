import 'package:flutter/material.dart';
import 'package:mytodo/theme/appSpacing.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //affichage du nom de l'utilisateur
        leading: Column(children: [

          ],
        ),

        //affichage du profile de lutilisateur
        actions: [
          Container(
            child: Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                  child: Icon(
                    Icons.person,
                    size: 22,
                    color: Theme.of(context).scaffoldBackgroundColor,
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
