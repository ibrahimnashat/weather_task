import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> confirgureDependency() async =>
    await getIt.init(environment: 'dev').addPackages();

extension InitialPackages on GetIt {
  Future<GetIt> addPackages() async {
    final getIt = GetItHelper(this);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    getIt.factory<SharedPreferences>(() => sharedPreferences);
    getIt.factory<Dio>(() => Dio());
    return this;
  }
}
