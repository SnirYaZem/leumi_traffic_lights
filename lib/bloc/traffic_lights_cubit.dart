import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:leumi_traffic_lights/models/traffic_light_model.dart';

part 'traffic_lights_state.dart';

class TrafficLightsCubit extends Cubit<TrafficLightsState> {
  bool _chaosMode;

  TrafficLightsCubit({required bool chaosMode}) : _chaosMode = chaosMode, super(TrafficLightsState()) {
    _init();
  }

  void _init() {
    emit(
      state.copyWith(
        trafficLightsModels: List.generate(1000, (index) {
          return TrafficLightModel(chaosMode: _chaosMode);
        }),
      ),
    );
  }

  void onChangeChaosMode(bool chaosMode) {
    _chaosMode = chaosMode;
    emit(
      state.copyWith(
        trafficLightsModels:
            state.trafficLightsModels.map((e) {
              return e.copyWith(chaosMode: _chaosMode);
            }).toList(),
      ),
    );
  }
}
