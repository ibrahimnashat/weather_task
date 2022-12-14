import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'web_services.mocks.dart';

@GenerateNiceMocks([MockSpec<Dio>(), MockSpec<Response>(), MockSpec<Options>()])
void main() {
  ///[testables]
  late Dio dio;
  late Response response;
  late Options options;
  late Function geet;
  late Function post;

  ///[setups]
  setUp(() {
    dio = MockDio();
    response = MockResponse();
    options = MockOptions();
    geet = () => dio.get('url', options: options);
    post = () => dio.post('url', data: {}, options: options);
  });

  ///[tests]
  group('Web Services', () {
    test("geet [GET]", () async {
      ///[arranges]
      when(geet()).thenAnswer((_) async => response);

      ///[act]
      Response result = await geet();

      ///[expections]
      verify(geet());
      verifyNoMoreInteractions(dio);
      expect(result.data, equals(response.data));
      expect(result, isA<Response>());
      expect(result, response);
    });
    test("post [POST]", () async {
      ///[arranges]
      when(post()).thenAnswer((_) async => response);

      ///[act]
      Response result = await post();

      ///[expections]
      verify(post());
      verifyNoMoreInteractions(dio);
      expect(result.data, equals(response.data));
      expect(result, isA<Response>());
      expect(result, response);
    });
  });
}
