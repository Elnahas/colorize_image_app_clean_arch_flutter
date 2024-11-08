import 'package:colorize_image_app_clean_arch_flutter/core/di/injector_config.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../services/dio_helper.dart';
import '../services/network_checker.dart';
import '../utils/media_picker.dart';

class CommonDi {
  CommonDi._();

  static Future<void> initialize() async {
    injector.registerLazySingleton(() => DioHelper());
    injector.registerLazySingleton(() => AppMediaPicker());
    injector.registerLazySingleton(() => InternetConnectionChecker());
    injector.registerLazySingleton(() => NetworkChecker(injector()));
  }
}
