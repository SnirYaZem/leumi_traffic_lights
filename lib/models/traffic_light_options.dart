import 'package:flutter/material.dart';

enum TrafficLightOptions {
  red,
  redAndYellow,
  green,
  yellow;

  Color get redLightColor {
    return Colors.red.withAlpha([red, redAndYellow].contains(this) ? 255 : (0.5 * 255).toInt());
  }

  Color get yellowLightColor {
    return Colors.yellow.withAlpha([redAndYellow, yellow].contains(this) ? 255 : (0.5 * 255).toInt());
  }

  Color get greenLightColor {
    return Colors.green.withAlpha(this == green ? 255 : (0.5 * 255).toInt());
  }
}
