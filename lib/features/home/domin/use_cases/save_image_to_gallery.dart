import 'dart:typed_data';

import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';

import '../../../../core/error_handling/failures.dart';


class SaveImageToGalleryUseCase{
  Future<String> call(Uint8List imageBytes) async{
print("SSSSSSSSSSSSSSSS :${imageBytes}}");
    final results = await ImageGallerySaverPlus.saveImage(
      imageBytes,
      quality: 100,
      name: 'colorize-image-${DateTime.now().millisecondsSinceEpoch}'
    );

    if(results["isSuccess"] == true){
      print("isSuccess");
      if(results["filePath"] == null){
        throw const CouldNotSaveImageFailure();
      }

      return results["filePath"];
    }else{
      print("isbad ${results.toString()}");
      throw const CouldNotSaveImageFailure();
    }
  }
}