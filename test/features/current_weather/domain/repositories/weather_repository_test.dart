import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_task/core/errors/failures.dart';
import 'package:weather_task/core/fixtures/fixture.dart';
import 'package:weather_task/features/current_weather/data/models/weather_model.dart';
import 'package:weather_task/features/current_weather/domain/entiries/weather.dart';
import 'package:weather_task/features/current_weather/domain/repositories/weather_repository.dart';

import 'weather_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<WeatherRepository>(), MockSpec<Failure>()])
void main() {
  ///[testables]
  late WeatherRepository weatherRepository;
  late Weather weather;
  const fixtrue = Fixtrue();
  late Failure failure;

  ///[setups]
  setUp(() async {
    weatherRepository = MockWeatherRepository();
    final json = await fixtrue.call('weather_data');
    weather = WeatherModel.fromJson(json);
    failure = MockFailure();
  });

  ///[tests]
  group('Domain layer (repositories) ', () {
    test('getCurrentWeather [Success]', () async {
      ///[arange]
      when(weatherRepository.getCurrentWeather())
          .thenAnswer((realInvocation) async => Right(weather));

      ///[act]
      final result = await weatherRepository.getCurrentWeather();

      ///[expections]
      verify(weatherRepository.getCurrentWeather());
      verifyNoMoreInteractions(weatherRepository);
      expect(result, Right(weather));
    });

    test('getCurrentWeather [Failure]', () async {
      ///[arrange]
      when(weatherRepository.getCurrentWeather())
          .thenAnswer((realInvocation) async => Left(failure));

      ///[act]
      final result = await weatherRepository.getCurrentWeather();

      ///[expections]
      verify(weatherRepository.getCurrentWeather());
      verifyNoMoreInteractions(weatherRepository);
      expect(result, Left(failure));
    });
  });
}
