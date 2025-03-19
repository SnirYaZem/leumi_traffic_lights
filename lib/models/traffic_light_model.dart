import 'dart:async';
import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:leumi_traffic_lights/models/traffic_light_options.dart';

class TrafficLightModel {
  final bool chaosMode;
  Timer? _timer;
  bool _isCancelled = false;
  ValueNotifier<TrafficLightOptions> lightOptionNotifier = ValueNotifier(TrafficLightOptions.red);

  TrafficLightModel({required this.chaosMode}) {
    initTimer();
  }

  void initTimer() {
    lightOptionNotifier.value = TrafficLightOptions.red;
    Timer(Duration(milliseconds: chaosMode ? Random().nextInt(5001) : 0), () {
      _startCycle();
      _timer = Timer.periodic(Duration(seconds: 9), (timer) async {
        await _startCycle();
      });
    });
  }

  Future<void> _startCycle() async {
    if (_isCancelled) return;
    lightOptionNotifier.value = TrafficLightOptions.red;
    await Future.delayed(Duration(milliseconds: 3000));
    if (_isCancelled) return;
    lightOptionNotifier.value = TrafficLightOptions.redAndYellow;
    await Future.delayed(Duration(milliseconds: 1500));
    if (_isCancelled) return;
    lightOptionNotifier.value = TrafficLightOptions.green;
    await Future.delayed(Duration(milliseconds: 3000));
    if (_isCancelled) return;
    lightOptionNotifier.value = TrafficLightOptions.yellow;
    await Future.delayed(Duration(milliseconds: 1500));
  }

  TrafficLightModel copyWith({bool? chaosMode}) {
    if ((chaosMode ?? this.chaosMode) != this.chaosMode) {
      _isCancelled = true;
      _timer?.cancel();
      return TrafficLightModel(chaosMode: chaosMode ?? this.chaosMode);
    } else {
      return this;
    }
  }
}
