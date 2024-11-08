import 'package:dio/dio.dart';

import '../../../../core/services/dio_helper.dart';
import '../models/inputs/colorize_image_api_input.dart';

class ColorizeImageDataSource{
  final DioHelper dioHelper;
  ColorizeImageDataSource(this.dioHelper);

  Future<Response<Map<String, dynamic>?>> generateColorizedImage(ColorizeImageApiInput apiInput) async{
    final FormData formData = FormData.fromMap(apiInput.toMap());
    return dioHelper.uploadImage(formData);
  }
}