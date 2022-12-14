import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_task/features/current_weather/domain/entiries/weather.dart';
import 'package:weather_task/features/current_weather/domain/repositories/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

@Injectable()
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc({required this.weatherRepository}) : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async {
      if (event is LoadWeather) {
        final weatherOrFailure = await weatherRepository.getCurrentWeather();
        weatherOrFailure.fold(
          (failure) {
            emit(const WeatherLoadingError(
              error: 'Please Check Your connection',
            ));
          },
          (weather) {
            emit(WeatherLoaded(weather: weather));
          },
        );
      }
    });
  }
}
