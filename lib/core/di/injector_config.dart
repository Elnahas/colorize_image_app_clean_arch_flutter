import 'package:colorize_image_app_clean_arch_flutter/core/di/common_di.dart';
import 'package:colorize_image_app_clean_arch_flutter/features/home/di/home_injectors.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  CommonDi.initialize();
  HomeDi.initialize();
}