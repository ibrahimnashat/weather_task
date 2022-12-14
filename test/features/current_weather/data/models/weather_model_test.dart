import 'package:flutter_test/flutter_test.dart';
import 'package:weather_task/core/fixtures/fixture.dart';
import 'package:weather_task/features/current_weather/data/models/weather_model.dart';

void main() async {
  ///[testables]
  late WeatherModel weather;
  final weatherJson = await const Fixtrue().call('weather_data');

  ///[setups]
  setUp(() {
    weather = WeatherModel.fromJson(weatherJson);
  });

  ///[tests]
  test('Data Layer (models) WeatherModel [ToJson]', () {
    ///[act]
    final result = weather.toJson();

    ///[expections]
    expect(result, isA<Map<String, dynamic>>());
    expect(result, equals(weatherJson));
  });
}
