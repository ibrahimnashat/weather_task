// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;
import 'package:weather_task/core/platform/network.dart' as _i6;
import 'package:weather_task/core/themes/themes.dart' as _i3;
import 'package:weather_task/core/web_services/web_services.dart' as _i7;
import 'package:weather_task/features/current_weather/data/data_sources/local_data_source.dart'
    as _i4;
import 'package:weather_task/features/current_weather/data/data_sources/remote_data_source.dart'
    as _i9;
import 'package:weather_task/features/current_weather/data/repositories/weather_repository_imp.dart'
    as _i11;
import 'package:weather_task/features/current_weather/domain/repositories/weather_repository.dart'
    as _i10;
import 'package:weather_task/features/current_weather/domain/usecases/get_current_weather.dart'
    as _i12;
import 'package:weather_task/features/current_weather/presentation/bloc/weather_bloc.dart'
    as _i13;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.ApplicationTheme>(() => _i3.WeatherTheme());
    gh.lazySingleton<_i4.LocalDataSource>(() =>
        _i4.LocalDataSourceImp(sharedPreferences: gh<_i5.SharedPreferences>()));
    gh.lazySingleton<_i6.Network>(() => _i6.NetworkStatus());
    gh.lazySingleton<_i7.WebServices>(
        () => _i7.WebServicesImp(dio: gh<_i8.Dio>()));
    gh.lazySingleton<_i9.RemoteDataSource>(
        () => _i9.RemoteDataSourceImp(webServices: gh<_i7.WebServices>()));
    gh.lazySingleton<_i10.WeatherRepository>(() => _i11.WeatherRepositoryImp(
          localDataSource: gh<_i4.LocalDataSource>(),
          remoteDataSource: gh<_i9.RemoteDataSource>(),
          network: gh<_i6.Network>(),
        ));
    gh.lazySingleton<_i12.GetCurrentWeather>(() => _i12.GetCurrentWeather(
        weatherRepository: gh<_i10.WeatherRepository>()));
    gh.factory<_i13.WeatherBloc>(() =>
        _i13.WeatherBloc(weatherRepository: gh<_i10.WeatherRepository>()));
    return this;
  }
}
