
import 'package:colorize_image_app_clean_arch_flutter/features/home/domin/entities/colorized_image_entity.dart';
import 'package:colorize_image_app_clean_arch_flutter/features/home/domin/entities/inputs/colorize_image_input.dart';

abstract class ColorizeImageRepository{
  Future<ColorizedImageEntity> getColorizedImage(ColorizeImageInput input);
}