import 'package:flutter/material.dart';
import 'package:leumi_traffic_lights/models/traffic_light_model.dart';

class TrafficLight extends StatelessWidget {
  final TrafficLightModel model;

  const TrafficLight({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.blueGrey,
      child: ValueListenableBuilder(
        valueListenable: model.lightOptionNotifier,
        builder: (context, option, child) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 16,
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(color: option.redLightColor, shape: BoxShape.circle),
              ),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(color: option.yellowLightColor, shape: BoxShape.circle),
              ),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(color: option.greenLightColor, shape: BoxShape.circle),
              ),
            ],
          );
        },
      ),
    );
  }
}
