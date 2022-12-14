import 'package:equatable/equatable.dart';

import 'condition.dart';

class State extends Equatable {
  final String lastUpdated;
  final double windDegree;
  final String windDir;
  final double tempC;
  final Condition weatherCondition;

  const State({
    required this.weatherCondition,
    required this.lastUpdated,
    required this.windDegree,
    required this.windDir,
    required this.tempC,
  });
  @override
  List<Object?> get props => [
        weatherCondition,
        lastUpdated,
        windDegree,
        windDir,
        tempC,
      ];
}
