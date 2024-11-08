import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_colors.dart';
import '../core/router/app_router.dart';
import '../core/router/routes.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRoutes;
  const MyApp({super.key, required this.appRoutes});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Colorize Image App',
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: AppColors.white),
            useMaterial3: true,
          ),
          initialRoute: Routes.home,
          onGenerateRoute: appRoutes.onGenerateRoute,

          // home: const OnBoardingScreen(),
        );
      },
    );
  }
}
