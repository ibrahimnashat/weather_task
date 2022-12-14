import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_task/features/current_weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_task/core/injection/injection.dart';
import 'package:weather_task/core/platform/context.dart';

class WeatherNewScreen extends StatefulWidget {
  const WeatherNewScreen({super.key});

  @override
  State<WeatherNewScreen> createState() => _WeatherNewScreenState();
}

class _WeatherNewScreenState extends State<WeatherNewScreen> {
  @override
  void initState() {
    _bloc.add(LoadWeather());
    super.initState();
  }

  final _bloc = getIt<WeatherBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: BlocBuilder<WeatherBloc, WeatherState>(
            bloc: _bloc,
            builder: (context, state) {
              if (state is WeatherLoaded) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      'https:${state.weather.weatherState.weatherCondition.icon}',
                      width: 120,
                      height: 120,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const SizedBox(
                          width: 120,
                          height: 120,
                        );
                      },
                    ),
                    Text(
                      state.weather.weatherState.weatherCondition.text,
                      style: context.textTheme.titleLarge,
                    ),
                    Text(
                      "${state.weather.weatherState.tempC} C",
                      style: context.textTheme.titleLarge,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                      child: Text(
                        "${state.weather.weatherLocation.country} - ${state.weather.weatherLocation.region}",
                        style: context.textTheme.bodyMedium,
                      ),
                    ),
                    Text(
                      state.weather.weatherState.lastUpdated,
                      style: context.textTheme.bodySmall,
                    ),
                  ],
                );
              } else if (state is WeatherLoadingError) {
                return Center(
                  child: Text(
                    state.error,
                    style: context.textTheme.bodyMedium,
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }
}
