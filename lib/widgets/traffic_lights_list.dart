import 'package:flutter/material.dart';
import 'package:leumi_traffic_lights/widgets/traffic_light.dart';

class TrafficLightsList extends StatelessWidget {
  final bool chaosMode;

  const TrafficLightsList({super.key, this.chaosMode = true});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        mainAxisExtent: 154,
      ),
      itemBuilder: (context, index) {
        return TrafficLight(chaosMode: chaosMode);
      },
      itemCount: 1000,
    );
  }
}
