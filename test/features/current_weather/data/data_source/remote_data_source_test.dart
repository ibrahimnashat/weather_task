import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_task/core/web_services/web_services.dart';

import 'remote_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<WebServices>()])
void main() {
  ///[testables]
  late WebServices webServices;
  late Function geet;

  ///[setups]
  setUp(() {
    webServices = MockWebServices();
    geet = () => webServices.geet(endPoint: '');
  });

  ///[tests]
  group("Data Layer (datasources)", () {
    test("getCurrentWeather [Geet]", () async {
      ///[arranges]
      when(geet()).thenAnswer((_) async => <String, dynamic>{});

      ///[act]
      final result = await geet();

      ///[expections]
      verify(geet());
      verifyNoMoreInteractions(webServices);
      expect(result, <String, dynamic>{});
    });
  });
}
