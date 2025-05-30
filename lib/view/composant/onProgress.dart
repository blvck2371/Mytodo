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
          decoration: BoxDecoration(
            color: Theme.of(context).appBarTheme.backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),

            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                offset: Offset(0, 6), // Décalage de l’ombre vers le bas
                blurRadius: 10,
              ),
            ],
          ),
          width: MediaQuery.of(context).size.width / 1.40,
          padding: EdgeInsets.all(AppSpacing.md),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.taches.nom}',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          '${widget.taches.dateCreation}',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
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
                    child: Icon(
                      Icons.people,
                      size: 35,
                      color: Theme.of(context).appBarTheme.backgroundColor,
                    ),
                  ),
                ],
              ),
              Divider(),
              Text(
                'Description: ',
                style: Theme.of(context).textTheme.titleSmall,
              ),
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
                          Text(
                            'equipe: ',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
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
                      Text(
                        'Progresion',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
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
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
