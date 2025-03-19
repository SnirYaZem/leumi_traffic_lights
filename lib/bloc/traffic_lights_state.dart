part of 'traffic_lights_cubit.dart';

class TrafficLightsState extends Equatable {
  final List<TrafficLightModel> trafficLightsModels;

  const TrafficLightsState({this.trafficLightsModels = const []});

  @override
  List<Object?> get props => [trafficLightsModels, identityHashCode(this)];

  TrafficLightsState copyWith({List<TrafficLightModel>? trafficLightsModels}) {
    return TrafficLightsState(trafficLightsModels: trafficLightsModels ?? this.trafficLightsModels);
  }
}
