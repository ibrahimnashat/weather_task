import 'package:flutter_test/flutter_test.dart';
import 'package:weather_task/core/fixtures/fixture.dart';
import 'package:weather_task/features/current_weather/data/models/location_model.dart';

void main() async {
  ///[testables]
  late LocationModel location;
  final locationJson = await const Fixtrue().call('location_data');

  ///[setups]
  setUp(() {
    location = LocationModel.fromJson(locationJson);
  });

  ///[tests]
  test('Data Layer (models) LocationModel [ToJson]', () {
    ///[act]
    final result = location.toJson();

    ///[expections]
    expect(result, isA<Map<String, dynamic>>());
    expect(result, equals(locationJson));
  });
}
