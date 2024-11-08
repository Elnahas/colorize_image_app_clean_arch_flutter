
import 'package:colorize_image_app_clean_arch_flutter/features/home/data/mappers/colorize_image_mapper.dart';
import 'package:colorize_image_app_clean_arch_flutter/features/home/data/mappers/image_input_mapper.dart';
import 'package:colorize_image_app_clean_arch_flutter/features/home/domin/entities/inputs/colorize_image_input.dart';

import '../../../../../core/error_handling/failures.dart';
import '../../../domin/entities/colorized_image_entity.dart';
import '../../../domin/repositories/colorize_image_repository.dart';
import '../../data_sources/colorize_image_datasource.dart';
import '../image_response_model.dart';

class ColorizeImageRepositoryImpl implements ColorizeImageRepository{
  final ColorizeImageDataSource _colorizeImageDataSource;
  ColorizeImageRepositoryImpl(this._colorizeImageDataSource);

  @override
  Future<ColorizedImageEntity> getColorizedImage(ColorizeImageInput input) async{
    final response = await _colorizeImageDataSource.generateColorizedImage(await input.mapToApiInput());

    if(response.data == null){
      throw const ServerFailure("no data");
    }

    final imageResponseModel = ImageResponseModel.fromJson(response.data!);

    if(imageResponseModel.status != 200 && imageResponseModel.data != null){
      throw ServerFailure(imageResponseModel.message ?? '' , code: imageResponseModel.status);
    }

    return imageResponseModel.data!.mapToEntity();
  }

}