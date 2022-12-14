import 'package:flutter_test/flutter_test.dart';
import 'package:weather_task/core/fixtures/fixture.dart';
import 'package:weather_task/features/current_weather/data/models/state_model.dart';

void main() async {
  ///[testables]
  late StateModel state;
  final stateJson = await const Fixtrue().call('state_data');

  ///[setups]
  setUp(() {
    state = StateModel.fromJson(stateJson);
  });

  ///[tests]
  test('Data Layer (models) StateModel [ToJson]', () {
    ///[act]
    final result = state.toJson();

    ///[expections]
    expect(result, isA<Map<String, dynamic>>());
    expect(result, equals(stateJson));
  });
}
