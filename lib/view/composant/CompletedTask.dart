import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mytodo/model/tache.dart';
import 'package:mytodo/theme/appSpacing.dart';

class CompletedTask extends StatefulWidget {
  CompletedTask({super.key, required this.taches});
  final Tache taches;

  @override
  State<CompletedTask> createState() => _CompletedTaskState();
}

class _CompletedTaskState extends State<CompletedTask> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),

      child: Row(
        children: [
          //bar horizontal
          Container(
            width: 10,
            height: 130,

            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(AppSpacing.sm),
              child: Column(
                children: [
                  //premeiere section
                  Container(
                    height: 50,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.taches.nom}',
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            Text('${widget.taches.description}'),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),

                          child: Icon(
                            Icons.check,
                            size: 20,
                            color:
                                Theme.of(context).appBarTheme.backgroundColor,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //division
                  Divider(height: 10),

                  //compartiment du bas
                  Container(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${widget.taches.dateCreation}'),
                        Container(
                          margin: EdgeInsets.only(right: 20),

                          child: Icon(Icons.people_alt),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
