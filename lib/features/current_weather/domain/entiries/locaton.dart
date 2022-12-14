import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final String name;
  final String region;
  final String country;
  final String localtime;

  const Location({
    required this.name,
    required this.region,
    required this.country,
    required this.localtime,
  });

  @override
  List<Object?> get props => [
        name,
        region,
        country,
        localtime,
      ];
}
