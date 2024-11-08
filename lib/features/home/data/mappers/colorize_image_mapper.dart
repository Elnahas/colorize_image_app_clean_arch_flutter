import 'dart:convert';

import '../../domin/entities/colorized_image_entity.dart';
import '../models/image_response_model.dart';


extension ColorizeImageMapper on ColorizedImageModel{
  ColorizedImageEntity mapToEntity(){
    return ColorizedImageEntity(imageBytes: base64Decode(image??''));
  }
}