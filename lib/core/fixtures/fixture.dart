import 'dart:convert';
import 'dart:io';

import 'package:equatable/equatable.dart';

class Fixtrue extends Equatable {
  const Fixtrue();
  Future<Map<String, dynamic>> call(String file) async {
    return json.decode(
      await File('lib/core/fixtures/$file.json').readAsString(),
    );
  }

  @override
  List<Object?> get props => [];
}
