import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leumi_traffic_lights/widgets/traffic_light.dart';

import '../bloc/traffic_lights_cubit.dart';

class TrafficLightsList extends StatelessWidget {
  const TrafficLightsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrafficLightsCubit, TrafficLightsState>(
      builder: (context, state) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            mainAxisExtent: 154,
          ),
          itemBuilder: (BuildContext context, int index) {
            return TrafficLight(model: state.trafficLightsModels[index]);
          },
          itemCount: state.trafficLightsModels.length,
        );
      },
    );
  }
}
