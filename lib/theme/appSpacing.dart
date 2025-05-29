import 'package:flutter/material.dart';

extension SpacingExtensions on num {
  SizedBox get vSpace => SizedBox(height: toDouble());
  SizedBox get hSpace => SizedBox(width: toDouble());
}
