import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:leumi_traffic_lights/models/traffic_light_options.dart';

class TrafficLight extends StatefulWidget {
  final bool chaosMode;

  const TrafficLight({super.key, this.chaosMode = true});

  @override
  State<TrafficLight> createState() => _TrafficLightState();
}

class _TrafficLightState extends State<TrafficLight> with AutomaticKeepAliveClientMixin {
  TrafficLightOptions lightOption = TrafficLightOptions.red;
  bool isCancelled = false;
  Timer? lightTimer;

  @override
  void initState() {
    initTimer();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant TrafficLight oldWidget) {
    if (oldWidget.chaosMode != widget.chaosMode) {
      isCancelled = true;
      initTimer();
    }
    super.didUpdateWidget(oldWidget);
  }

  void initTimer() {
    lightTimer?.cancel();
    if (mounted) {
      setState(() {
        lightOption = TrafficLightOptions.red;
      });
    }
    Future.delayed(Duration(milliseconds: widget.chaosMode ? Random().nextInt(5001) : 0), () {
      isCancelled = false;
      _doTrafficLightsCycle();
      lightTimer = Timer.periodic(Duration(seconds: 9), (timer) async {
        await _doTrafficLightsCycle();
      });
    });
  }

  Future<void> _doTrafficLightsCycle() async {
    if (isCancelled) return;
    if (mounted) {
      setState(() {
        lightOption = TrafficLightOptions.red;
      });
    }
    if (isCancelled) return;
    await Future.delayed(Duration(milliseconds: 3000));
    if (isCancelled) return;
    if (mounted) {
      setState(() {
        lightOption = TrafficLightOptions.redAndYellow;
      });
    }
    if (isCancelled) return;
    await Future.delayed(Duration(milliseconds: 1500));
    if (isCancelled) return;
    if (mounted) {
      setState(() {
        lightOption = TrafficLightOptions.green;
      });
    }
    if (isCancelled) return;
    await Future.delayed(Duration(milliseconds: 3000));
    if (isCancelled) return;
    if (mounted) {
      setState(() {
        lightOption = TrafficLightOptions.yellow;
      });
    }
    if (isCancelled) return;
    await Future.delayed(Duration(milliseconds: 1500));
    if (isCancelled) return;
  }

  @override
  void dispose() {
    lightTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.blueGrey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(color: lightOption.getRedLightColor(), shape: BoxShape.circle),
          ),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(color: lightOption.getYellowLightColor(), shape: BoxShape.circle),
          ),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(color: lightOption.getGreenLightColor(), shape: BoxShape.circle),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
