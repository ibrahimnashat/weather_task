import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_task/core/fixtures/fixture.dart';
import 'package:weather_task/features/current_weather/data/data_sources/local_data_source.dart';

import 'local_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SharedPreferences>()])
late SharedPreferences sharedPreferences;
late String weatherString;
void main() async {
  ///[testables]
  final weatherJson = await const Fixtrue().call('weather_data');

  ///[setups]
  setUp(() {
    sharedPreferences = MockSharedPreferences();
    weatherString = json.encode(weatherJson);
  });

  ///[tests]
  group('Data Layer (datasources)', () {
    testStoreTodayWeather(
      description: "storeTodayWeather [True]",
      state: true,
    );

    testStoreTodayWeather(
      description: "storeTodayWeather [False]",
      state: false,
    );

    testGetCachedLastWeather(
      description: "getCachedLastWeather [String]",
      valueOrNull: json.encode(weatherJson),
    );
    testGetCachedLastWeather(
      description: "getCachedLastWeather [Null]",
      valueOrNull: null,
    );
  });
}

void testStoreTodayWeather({
  required String description,
  required bool state,
}) {
  test(description, () async {
    ///[arranges]
    when(sharedPreferences.setString(LAST_LOADED_WEATHER, weatherString))
        .thenAnswer((_) async => state);

    ///[act]
    final result = await sharedPreferences.setString(
      LAST_LOADED_WEATHER,
      weatherString,
    );

    ///[expections]
    verify(
      sharedPreferences.setString(
        LAST_LOADED_WEATHER,
        weatherString,
      ),
    );
    verifyNoMoreInteractions(sharedPreferences);
    expect(result, state);
  });
}

void testGetCachedLastWeather({
  required String description,
  required String? valueOrNull,
}) {
  test(description, () async {
    ///[arranges]
    when(sharedPreferences.getString(LAST_LOADED_WEATHER))
        .thenAnswer((_) => valueOrNull);

    ///[act]
    final result = sharedPreferences.getString(LAST_LOADED_WEATHER);

    ///[expections]
    verify(
      sharedPreferences.getString(LAST_LOADED_WEATHER),
    );
    verifyNoMoreInteractions(sharedPreferences);
    expect(result, valueOrNull);
  });
}
