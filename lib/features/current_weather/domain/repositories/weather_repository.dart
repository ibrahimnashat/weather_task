import 'package:dartz/dartz.dart';
import 'package:weather_task/core/errors/failures.dart';
import 'package:weather_task/features/current_weather/domain/entiries/weather.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Weather>> getCurrentWeather();
}
