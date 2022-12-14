import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_task/core/errors/failures.dart';
import 'package:weather_task/features/current_weather/domain/entiries/weather.dart';
import 'package:weather_task/features/current_weather/domain/repositories/weather_repository.dart';

@LazySingleton()
class GetCurrentWeather {
  final WeatherRepository weatherRepository;
  const GetCurrentWeather({required this.weatherRepository});

  Future<Either<Failure, Weather>> call() async {
    return weatherRepository.getCurrentWeather();
  }
}
