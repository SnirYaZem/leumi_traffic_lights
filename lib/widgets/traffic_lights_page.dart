import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leumi_traffic_lights/bloc/traffic_lights_cubit.dart';
import 'package:leumi_traffic_lights/widgets/traffic_lights_list.dart';
import 'package:leumi_traffic_lights/widgets/traffic_lights_mode_button.dart';

class TrafficLightsPage extends StatelessWidget {
  const TrafficLightsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrafficLightsCubit(chaosMode: true),
      child: Builder(
        builder: (context) {
          return SafeArea(
            child: Scaffold(
              body: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TrafficLightsModeButton(
                    onPressed: (chaosMode) {
                      context.read<TrafficLightsCubit>().onChangeChaosMode(chaosMode);
                    },
                  ),
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return SingleChildScrollView(
                          child: SizedBox(height: constraints.maxHeight, child: TrafficLightsList()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
