import 'package:flutter/material.dart';
import 'package:leumi_traffic_lights/widgets/traffic_lights_list.dart';
import 'package:leumi_traffic_lights/widgets/traffic_lights_mode_button.dart';

class TrafficLightsPage extends StatefulWidget {
  const TrafficLightsPage({super.key});

  @override
  State<TrafficLightsPage> createState() => _TrafficLightsPageState();
}

class _TrafficLightsPageState extends State<TrafficLightsPage> {
  bool chaosMode = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TrafficLightsModeButton(
              onPressed: (chaosMode) {
                setState(() {
                  this.chaosMode = chaosMode;
                });
              },
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: SizedBox(height: constraints.maxHeight, child: TrafficLightsList(chaosMode: chaosMode)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
