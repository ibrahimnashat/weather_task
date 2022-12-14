import 'package:flutter_test/flutter_test.dart';
import 'package:weather_task/core/fixtures/fixture.dart';
import 'package:weather_task/features/current_weather/data/models/condition_model.dart';

void main() async {
  ///[testables]
  late ConditonModel condition;
  final conditionJson = await const Fixtrue().call('condition_data');

  ///setups
  setUp(() {
    condition = ConditonModel.fromJson(conditionJson);
  });

  ///[tests]
  test('Data Layer (models) ConditonModel [ToJson]', () {
    ///[act]
    final result = condition.toJson();

    ///[expections]
    expect(result, isA<Map<String, dynamic>>());
    expect(result, equals(conditionJson));
  });
}
