// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_task/core/errors/exceptions.dart';
import 'package:weather_task/features/current_weather/data/models/weather_model.dart';

const LAST_LOADED_WEATHER = 'LAST_LOADED_WEATHER';

abstract class LocalDataSource {
  Future<WeatherModel> getCachedLastWeather();
  Future<Unit> storeTodayWeather({required WeatherModel todayWeather});
}

@LazySingleton(as: LocalDataSource)
class LocalDataSourceImp extends LocalDataSource {
  final SharedPreferences sharedPreferences;
  LocalDataSourceImp({required this.sharedPreferences});
  @override
  Future<Unit> storeTodayWeather({required WeatherModel todayWeather}) async {
    try {
      await sharedPreferences.setString(
        LAST_LOADED_WEATHER,
        json.encode(todayWeather.toJson()),
      );
      return unit;
    } catch (e) {
      throw CachedException();
    }
  }

  @override
  Future<WeatherModel> getCachedLastWeather() async {
    try {
      String? weatherString = sharedPreferences.getString(LAST_LOADED_WEATHER);
      if (weatherString == null) {
        throw CachedException();
      } else {
        return WeatherModel.fromJson(json.decode(weatherString));
      }
    } catch (e) {
      throw CachedException();
    }
  }
}
