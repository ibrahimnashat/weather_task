// Mocks generated by Mockito 5.3.2 from annotations
// in weather_task/test/features/current_weather/data/repositories/weather_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:weather_task/core/platform/network.dart' as _i7;
import 'package:weather_task/features/current_weather/data/data_sources/local_data_source.dart'
    as _i4;
import 'package:weather_task/features/current_weather/data/data_sources/remote_data_source.dart'
    as _i6;
import 'package:weather_task/features/current_weather/data/models/weather_model.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeWeatherModel_0 extends _i1.SmartFake implements _i2.WeatherModel {
  _FakeWeatherModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUnit_1 extends _i1.SmartFake implements _i3.Unit {
  _FakeUnit_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [LocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalDataSource extends _i1.Mock implements _i4.LocalDataSource {
  @override
  _i5.Future<_i2.WeatherModel> getCachedLastWeather() => (super.noSuchMethod(
        Invocation.method(
          #getCachedLastWeather,
          [],
        ),
        returnValue: _i5.Future<_i2.WeatherModel>.value(_FakeWeatherModel_0(
          this,
          Invocation.method(
            #getCachedLastWeather,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i2.WeatherModel>.value(_FakeWeatherModel_0(
          this,
          Invocation.method(
            #getCachedLastWeather,
            [],
          ),
        )),
      ) as _i5.Future<_i2.WeatherModel>);
  @override
  _i5.Future<_i3.Unit> storeTodayWeather(
          {required _i2.WeatherModel? todayWeather}) =>
      (super.noSuchMethod(
        Invocation.method(
          #storeTodayWeather,
          [],
          {#todayWeather: todayWeather},
        ),
        returnValue: _i5.Future<_i3.Unit>.value(_FakeUnit_1(
          this,
          Invocation.method(
            #storeTodayWeather,
            [],
            {#todayWeather: todayWeather},
          ),
        )),
        returnValueForMissingStub: _i5.Future<_i3.Unit>.value(_FakeUnit_1(
          this,
          Invocation.method(
            #storeTodayWeather,
            [],
            {#todayWeather: todayWeather},
          ),
        )),
      ) as _i5.Future<_i3.Unit>);
}

/// A class which mocks [RemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoteDataSource extends _i1.Mock implements _i6.RemoteDataSource {
  @override
  _i5.Future<_i2.WeatherModel> getCurrentWeather() => (super.noSuchMethod(
        Invocation.method(
          #getCurrentWeather,
          [],
        ),
        returnValue: _i5.Future<_i2.WeatherModel>.value(_FakeWeatherModel_0(
          this,
          Invocation.method(
            #getCurrentWeather,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i2.WeatherModel>.value(_FakeWeatherModel_0(
          this,
          Invocation.method(
            #getCurrentWeather,
            [],
          ),
        )),
      ) as _i5.Future<_i2.WeatherModel>);
}

/// A class which mocks [Network].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetwork extends _i1.Mock implements _i7.Network {
  @override
  _i5.Future<bool> get isConnected => (super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: _i5.Future<bool>.value(false),
        returnValueForMissingStub: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
}
