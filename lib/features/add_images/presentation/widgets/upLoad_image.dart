import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:dashboard_market/core/functions/reduce_image_size.dart';
import 'package:dashboard_market/features/add_images/presentation/manager/images_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_picker/image_picker.dart'; // للجوالب
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import '../../../../core/resources/color_manager.dart';
import 'package:flutter/services.dart';

class UpLoadImage extends StatefulWidget {
  const UpLoadImage({
    super.key, required this.viewModel,

  });

  final ImagesCubit viewModel;

  @override
  State<UpLoadImage> createState() => _TabBodySellerState();
}

class _TabBodySellerState extends State<UpLoadImage> {

  Future<File?> _pickImage() async {
    final XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      final File originalImageFile = File(xFile.path);
      final String extension = xFile.path.split('.').last.toLowerCase();

      if (extension == 'webp') {
        setState(() {
          widget.viewModel.imageFile = originalImageFile;
        });
        return originalImageFile;
      }

      final File resizedImageFile = await resizeAndCompressImage(
        imageFile: originalImageFile,
      );

      setState(() {
        widget.viewModel.imageFile = resizedImageFile;
      });

      return resizedImageFile;
    }

    return null;
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * .10),
      child: GestureDetector(
        onTap: _pickImage,
        child: Column(
          children: [
            if ( widget.viewModel.imageFile != null)
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: ColorManager.primaryColor, width: 3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: AspectRatio(
                  aspectRatio: 16/9,
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.file(
                      widget.viewModel.imageFile!,
                      fit: BoxFit.fill,
                      width: double.infinity,
                    ),
                  ),
                ),
              )
            else
              Container(
                decoration: BoxDecoration(

                  border: Border.all(color: ColorManager.primaryColor, width: 3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: AspectRatio(
                  aspectRatio: 16/9,
                  child: Container(
                    padding: EdgeInsets.all(0),
                    clipBehavior: Clip.antiAlias,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset(
                      'assets/images/image_default.jpg',
                      // 'widget.urlImage',
                      fit: BoxFit.fill,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}