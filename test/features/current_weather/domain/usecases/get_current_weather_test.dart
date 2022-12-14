import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_task/core/fixtures/fixture.dart';
import 'package:weather_task/features/current_weather/data/models/weather_model.dart';
import 'package:weather_task/features/current_weather/domain/entiries/weather.dart';
import 'package:weather_task/features/current_weather/domain/repositories/weather_repository.dart';
import 'package:weather_task/features/current_weather/domain/usecases/get_current_weather.dart';

import '../repositories/weather_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<WeatherRepository>()])
void main() async {
  ///[testables]
  late WeatherRepository weatherRepository;
  late GetCurrentWeather getCurrentWeather;
  late Weather weather;
  final weatherJson = await const Fixtrue().call('weather_data');

  ///[setups]
  setUp(() {
    weather = WeatherModel.fromJson(weatherJson);
    weatherRepository = MockWeatherRepository();
    getCurrentWeather = GetCurrentWeather(weatherRepository: weatherRepository);
  });

  ///[tests]
  group("Domain layer (usecases) ", () {
    test('getCurrentWeather [Success]', () async {
      ///[arrange]
      when(getCurrentWeather.call())
          .thenAnswer((realInvocation) async => Right(weather));

      ///[act]
      final result = await getCurrentWeather();

      ///[excpections]
      verify(getCurrentWeather());
      verifyNoMoreInteractions(weatherRepository);
      expect(result, Right(weather));
    });

    test('getCurrentWeather [Failure]', () async {
      ///[arrange]
      when(getCurrentWeather.call())
          .thenAnswer((realInvocation) async => Right(weather));

      ///[act]
      final result = await getCurrentWeather();

      ///[expections]
      verify(getCurrentWeather());
      verifyNoMoreInteractions(weatherRepository);
      expect(result, Right(weather));
    });
  });
}
