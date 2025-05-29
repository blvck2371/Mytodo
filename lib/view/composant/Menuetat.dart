import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mytodo/theme/appSpacing.dart';

class MenuEtat extends StatefulWidget {
  MenuEtat({super.key, required this.menu, required this.nombre});
  final String menu;
  final String nombre;

  @override
  State<MenuEtat> createState() => _MenuEtatState();
}

class _MenuEtatState extends State<MenuEtat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: AppSpacing.lg, right: AppSpacing.lg),
      height: 40,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(widget.menu, style: Theme.of(context).textTheme.titleLarge),
              Text("(" + widget.nombre + ")"),
            ],
          ),
          InkWell(
            child: Text(
              "voir plus..",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
