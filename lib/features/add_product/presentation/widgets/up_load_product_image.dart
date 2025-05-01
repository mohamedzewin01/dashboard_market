import 'dart:io';

import 'package:dashboard_market/core/functions/reduce_image_size.dart';
import 'package:dashboard_market/features/add_product/presentation/manager/ProductPhoto/product_photo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UpLoadProductImage extends StatefulWidget {
  const UpLoadProductImage({
    super.key, required this.viewModel,

  });

  final ProductPhotoCubit viewModel;

  @override
  State<UpLoadProductImage> createState() => _TabBodySellerState();
}

class _TabBodySellerState extends State<UpLoadProductImage> {

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
    return GestureDetector(
      onTap: _pickImage,
      child: Padding(
        padding:const EdgeInsets.symmetric(
            horizontal: 20),
        child: Column(
          children: [
            if ( widget.viewModel.imageFile != null)
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  // border: Border.all(color: ColorManager.primaryColor, width: 3),
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
            else  const Icon(
              Icons.add_a_photo_outlined,
              color: Colors.grey,
            ),

          ],
        ),
      ),
    );
  }
}
