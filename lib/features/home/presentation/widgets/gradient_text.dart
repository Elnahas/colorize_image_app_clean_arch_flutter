import 'package:colorize_image_app_clean_arch_flutter/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_styles.dart';

class GradientText extends StatelessWidget {
  final String text;
  const GradientText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) {
        return const LinearGradient(
          colors: AppColors.primaryGradientColor,
        ).createShader(bounds);
      },
      child: Text(
        text,
        style: AppTextStyles.bold(fontSize: AppDimensions.smallDisplay),
      ),

    );
  }
}
