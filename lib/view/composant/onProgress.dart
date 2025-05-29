import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:mytodo/model/tache.dart';
import 'package:mytodo/theme/appSpacing.dart';

class OnProgress extends StatefulWidget {
  OnProgress({super.key, required this.taches});

  final Tache taches;

  @override
  State<OnProgress> createState() => _OnProgressState();
}

class _OnProgressState extends State<OnProgress> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 1.40,
          padding: EdgeInsets.all(AppSpacing.sm),
          color: Theme.of(context).appBarTheme.backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${widget.taches.nom}'),
                        Text('${widget.taches.dateCreation}'),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    height: 55,
                    width: 55,
                    child: Icon(Icons.people, size: 35),
                  ),
                ],
              ),
              Divider(),
              Text('Description: '),
              Text('${widget.taches.description}'),

              //equipe
              20.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('equipe: '),
                          Row(
                            children: [
                              Icon(Icons.person),
                              Icon(Icons.person),
                              Icon(Icons.person),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  // progression bar
                  Column(
                    children: [
                      Text('Progresion'),
                      5.vSpace,
                      Row(
                        children: [
                          Container(
                            height: 27,
                            width: 27,
                            child: CircularProgressIndicator(
                              value: 0.78, // 78 %
                              strokeWidth: 4, // épaisseur (optionnel)
                              backgroundColor: Colors.grey, // arrière-plan
                              valueColor: AlwaysStoppedAnimation(
                                Theme.of(
                                  context,
                                ).primaryColor, // couleur de progression
                              ),
                            ),
                          ),
                          7.hSpace,
                          Text('78%'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              //progress
            ],
          ),
        ),

        // colorsbarrrr
        Container(
          width: MediaQuery.of(context).size.width / 1.40,
          height: AppSpacing.sm,
          color: Theme.of(context).primaryColor,
        ),
      ],
    );
  }
}
