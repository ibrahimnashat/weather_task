import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_task/core/fixtures/fixture.dart';
import 'package:weather_task/core/platform/network.dart';
import 'package:weather_task/features/current_weather/data/data_sources/local_data_source.dart';
import 'package:weather_task/features/current_weather/data/data_sources/remote_data_source.dart';
import 'package:weather_task/features/current_weather/data/models/weather_model.dart';

import 'weather_repository_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<LocalDataSource>(),
  MockSpec<RemoteDataSource>(),
  MockSpec<Network>()
])
late LocalDataSource localDataSource;
late RemoteDataSource remoteDataSource;
late Network network;
late WeatherModel weather;

void main() async {
  ///[testables]
  final weatherJson = await const Fixtrue().call('weather_data');

  ///[setups]
  setUp(() {
    localDataSource = MockLocalDataSource();
    remoteDataSource = MockRemoteDataSource();
    network = MockNetwork();
    weather = WeatherModel.fromJson(weatherJson);
  });

  ///[tests]
  group('Data Layer (repositories)', () {
    ///[on network connected state]
    testNetwordState(
      description: 'isConnected [True]',
      state: true,
    );
    group('On Connected', () {
      test('getCurrentWeather', () async {
        ///[arrage]
        when(remoteDataSource.getCurrentWeather())
            .thenAnswer((_) async => weather);

        ///[act]
        final result = await remoteDataSource.getCurrentWeather();

        ///[expections]
        verify(remoteDataSource.getCurrentWeather());
        verifyNoMoreInteractions(remoteDataSource);
        verifyZeroInteractions(localDataSource);
        verifyZeroInteractions(network);
        expect(result, weather);
      });
      test('storeTodayWeather', () async {
        ///[arrange]
        when(localDataSource.storeTodayWeather(todayWeather: weather))
            .thenAnswer((realInvocation) async => unit);

        ///[act]
        final result =
            await localDataSource.storeTodayWeather(todayWeather: weather);

        ///[expections]
        verify(localDataSource.storeTodayWeather(todayWeather: weather));
        verifyNoMoreInteractions(localDataSource);
        verifyZeroInteractions(remoteDataSource);
        verifyZeroInteractions(network);
        expect(result, unit);
      });
    });

    ///[on disconnected state]
    testNetwordState(
      description: 'isConnected [False]',
      state: false,
    );
    group('On Disconnected', () {
      test('getCachedLastWeather', () async {
        ///[arrage]
        when(localDataSource.getCachedLastWeather())
            .thenAnswer((_) async => weather);

        ///[act]
        final result = await localDataSource.getCachedLastWeather();

        ///[expections]
        verify(localDataSource.getCachedLastWeather());
        verifyNoMoreInteractions(localDataSource);
        verifyZeroInteractions(remoteDataSource);
        verifyZeroInteractions(network);
        expect(result, weather);
      });
    });
  });
}

Future<void> testNetwordState({
  required String description,
  required bool state,
}) async {
  test(description, () async {
    ///[arrange]
    when(network.isConnected).thenAnswer((realInvocation) async => state);

    ///[act]
    final result = await network.isConnected;

    ///[expections]
    verify(network.isConnected);
    verifyNoMoreInteractions(network);
    verifyZeroInteractions(localDataSource);
    verifyZeroInteractions(remoteDataSource);
    expect(result, state);
  });
}
