import 'package:flutter/material.dart';
import 'package:leumi_traffic_lights/widgets/traffic_light.dart';

class TrafficLightsList extends StatelessWidget {
  final bool chaosMode;

  const TrafficLightsList({super.key, this.chaosMode = true});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        mainAxisExtent: 154,
      ),
      shrinkWrap: true,
      children: List.generate(1000, (index) {
        return TrafficLight(chaosMode: chaosMode);
      }),
    );
  }
}
