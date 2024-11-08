import 'dart:typed_data';

import 'package:colorize_image_app_clean_arch_flutter/core/router/routes.dart';
import 'package:colorize_image_app_clean_arch_flutter/features/home/presentation/ui/home_screen.dart';
import 'package:colorize_image_app_clean_arch_flutter/features/home/presentation/ui/image_download_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case Routes.imageDownload:
        return MaterialPageRoute(
          builder: (_) => ImageDownloadScreen(
            imageBytes: settings.arguments as Uint8List,
          ),
          settings: settings,
        );

      default:
        return null;
    }
  }
}
