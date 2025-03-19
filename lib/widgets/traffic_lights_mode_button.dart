import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leumi_traffic_lights/cubit/traffic_lights_cubit.dart';

class TrafficLightsModeButton extends StatefulWidget {
  final void Function(bool chaosMode)? onPressed;

  const TrafficLightsModeButton({super.key, this.onPressed});

  @override
  State<TrafficLightsModeButton> createState() => _TrafficLightsModeButtonState();
}

class _TrafficLightsModeButtonState extends State<TrafficLightsModeButton> {
  bool chaosMode = true;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.blue)),
      onPressed: () {
        setState(() {
          chaosMode = !chaosMode;
        });
        widget.onPressed?.call(chaosMode);
      },
      child: Text(chaosMode ? 'Synchronize' : 'Chaos', style: TextStyle(color: Colors.white)),
    );
  }
}
