import 'package:injectable/injectable.dart';
import 'package:weather_task/core/errors/exceptions.dart';
import 'package:weather_task/core/web_services/web_services.dart';
import 'package:weather_task/features/current_weather/data/models/weather_model.dart';

abstract class RemoteDataSource {
  Future<WeatherModel> getCurrentWeather();
}

@LazySingleton(as: RemoteDataSource)
class RemoteDataSourceImp extends RemoteDataSource {
  final WebServices webServices;

  RemoteDataSourceImp({
    required this.webServices,
  });
  @override
  Future<WeatherModel> getCurrentWeather() async {
    try {
      final weatherJson = await webServices.geet(
        endPoint:
            '/current.json?key=4c508d3f7b0745dfbcd94651221312&q=egypt&aqi=no',
      );
      return WeatherModel.fromJson(weatherJson);
    } catch (e) {
      throw ServerException();
    }
  }
}
