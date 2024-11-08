import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/error_handling/failures_handler.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_image.dart';
import '../../domin/use_cases/save_image_to_gallery.dart';

class ImageDownloadScreen extends StatefulWidget {
  final Uint8List imageBytes;
  const ImageDownloadScreen({super.key, required this.imageBytes});


  @override
  State<ImageDownloadScreen> createState() => _ImageDownloadScreenState();
}

class _ImageDownloadScreenState extends State<ImageDownloadScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("YOUR COLORIZED IMAGE",style: AppTextStyles.bold(
            fontSize: AppDimensions.xxLarge
        ),),
      ),

      body: SafeArea(
        child: Padding(
          padding: AppDimensions.pagePadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppImage.memory(imageBytes: widget.imageBytes),

              const SizedBox(height: AppPadding.medium,),

              AppButton(onTap: _saveImageToGallery, title: "Save",isLoading: isLoading,)
            ],
          ),
        ),
      ),
    );
  }

  void _saveImageToGallery() async{
    setState(() {
      isLoading = true;
    });

    await failuresHandler(() async{
       final imagePath = await SaveImageToGalleryUseCase().call(widget.imageBytes);
      log(imagePath.toString());
      Fluttertoast.showToast(msg: "Image saved successfully to your device.",backgroundColor: AppColors.green,textColor: AppColors.white);
    }, onError: (failure) {
      Fluttertoast.showToast(msg: failure.message,backgroundColor: AppColors.red,textColor: AppColors.white);
    },);


    setState(() {
      isLoading = false;
    });
  }
}
