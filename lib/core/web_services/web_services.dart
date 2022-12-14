// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class WebServices {
  Future<Map<String, dynamic>> geet({
    required String endPoint,
  });
  Future<Map<String, dynamic>> post({
    required String endPoint,
    required Map<String, dynamic> body,
  });
}

const BaseUrl = 'https://api.weatherapi.com/v1';

@LazySingleton(as: WebServices)
class WebServicesImp extends WebServices {
  final Dio dio;

  WebServicesImp({required this.dio});

  @override
  Future<Map<String, dynamic>> geet({required String endPoint}) async {
    final response = await dio.get(
      BaseUrl + endPoint,
      options: Options(contentType: 'application/json'),
    );
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> post({
    required String endPoint,
    required Map<String, dynamic> body,
  }) async {
    final response = await dio.post(
      BaseUrl + endPoint,
      data: body,
      options: Options(contentType: 'application/json'),
    );
    return response.data;
  }
}
