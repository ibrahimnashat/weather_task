import 'package:injectable/injectable.dart';
import 'package:weather_task/core/errors/exceptions.dart';
import 'package:weather_task/core/platform/network.dart';
import 'package:weather_task/features/current_weather/data/data_sources/local_data_source.dart';
import 'package:weather_task/features/current_weather/data/data_sources/remote_data_source.dart';
import 'package:weather_task/features/current_weather/domain/entiries/weather.dart';
import 'package:weather_task/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_task/features/current_weather/domain/repositories/weather_repository.dart';

@LazySingleton(as: WeatherRepository)
class WeatherRepositoryImp extends WeatherRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final Network network;

  WeatherRepositoryImp({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.network,
  });

  @override
  Future<Either<Failure, Weather>> getCurrentWeather() async {
    if (await network.isConnected) {
      try {
        final weather = await remoteDataSource.getCurrentWeather();
        await localDataSource.storeTodayWeather(todayWeather: weather);
        return Right(weather);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final weather = await localDataSource.getCachedLastWeather();
        return Right(weather);
      } on CachedException {
        return Left(CachedFailure());
      }
    }
  }
}
