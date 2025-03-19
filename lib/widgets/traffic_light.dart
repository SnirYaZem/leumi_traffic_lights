import 'package:flutter/material.dart';

class TrafficLight extends StatefulWidget {
  final bool chaosMode;

  const TrafficLight({super.key, this.chaosMode = true});

  @override
  State<TrafficLight> createState() => _TrafficLightState();
}

class _TrafficLightState extends State<TrafficLight> {
  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(16), child: Column(children: []));
  }
}
