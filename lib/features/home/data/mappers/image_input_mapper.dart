import 'package:dio/dio.dart';
import 'package:path/path.dart' as path;

import '../../domin/entities/inputs/colorize_image_input.dart';
import '../models/inputs/colorize_image_api_input.dart';

extension ImageMapper on ColorizeImageInput{
  Future<ColorizeImageApiInput> mapToApiInput() async{
    return ColorizeImageApiInput(
      file: await MultipartFile.fromFile(imageFile.path,filename: path.basename(imageFile.path)),
      sync: "1",
      returnType: "2"
    );
  }
}