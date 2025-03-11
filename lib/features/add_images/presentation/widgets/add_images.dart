import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_picker/image_picker.dart'; // للجوال
import 'package:image_picker_web/image_picker_web.dart'; // للويب
import 'package:share_plus/share_plus.dart';

import '../../../../core/resources/color_manager.dart';


class AddPicture extends StatefulWidget {
  const AddPicture({
    super.key,
    required this.urlImage,
  });

  final String urlImage;

  @override
  State<AddPicture> createState() => _TabBodySellerState();
}

class _TabBodySellerState extends State<AddPicture> {
  Uint8List? _imageBytes;
  File? _imageFile;

  Future<void> _pickImage() async {
    if (kIsWeb) {
      // للويب
      final image = await ImagePickerWeb.getImageAsBytes();
      if (image != null) {
        setState(() {
          _imageBytes = image;
        });
      }
    } else {

      final XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (xFile != null) {
        final File imageFile = File(xFile.path);
        setState(() {
          _imageFile = imageFile;
        });
      }
    }
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
            if (_imageBytes != null || _imageFile != null)
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
                    child: kIsWeb
                        ? Image.memory(
                      _imageBytes!,
                      fit: BoxFit.fill,
                      width: double.infinity,
                    )
                        : Image.file(
                      _imageFile!,
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
                    child: Image.network(
                      widget.urlImage,
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