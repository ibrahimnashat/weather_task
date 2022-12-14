import 'package:flutter/material.dart';
import 'package:weather_task/core/injection/injection.dart';
import 'package:weather_task/core/themes/themes.dart';
import 'package:weather_task/features/current_weather/presentation/views/weather_now_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await confirgureDependency();
  runApp(WeatherRoot(theme: getIt<ApplicationTheme>()));
}

class WeatherRoot extends StatelessWidget {
  final ApplicationTheme theme;
  const WeatherRoot({
    super.key,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.styleTheme,
      home: const WeatherNewScreen(),
    );
  }
}
