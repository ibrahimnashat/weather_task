import 'package:equatable/equatable.dart';
import 'package:weather_task/features/current_weather/domain/entiries/state.dart';
import 'package:weather_task/features/current_weather/domain/entiries/locaton.dart';

class Weather extends Equatable {
  final Location weatherLocation;
  final State weatherState;

  const Weather({
    required this.weatherState,
    required this.weatherLocation,
  });

  @override
  List<Object?> get props => [
        weatherState,
        weatherLocation,
      ];
}
