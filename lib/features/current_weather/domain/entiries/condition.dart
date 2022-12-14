import 'package:equatable/equatable.dart';

class Condition extends Equatable {
  final String text;
  final String icon;
  final double code;

  const Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  @override
  List<Object?> get props => [
        text,
        code,
        icon,
      ];
}
