part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Weather weather;
  const WeatherLoaded({required this.weather});

  @override
  List<Object> get props => [weather];
}

class WeatherLoadingError extends WeatherState {
  final String error;
  const WeatherLoadingError({required this.error});

  @override
  List<Object> get props => [error];
}
