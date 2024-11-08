import 'package:colorize_image_app_clean_arch_flutter/app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/injector_config.dart';
import 'core/router/app_router.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  await initializeDependencies();
  runApp( MyApp(appRoutes: AppRouter(),));
}