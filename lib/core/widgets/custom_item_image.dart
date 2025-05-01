

import 'package:flutter/material.dart';

import '../resources/cashed_image.dart';
import '../resources/color_manager.dart';
import '../resources/style_manager.dart';

class CustomItemImage extends StatelessWidget {
  const CustomItemImage({
    super.key,
    required this.imagePath,
    required this.imageName, this.onPressedDelete,
  });

  final String imagePath;
  final String imageName;
  final void Function()? onPressedDelete;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          border: Border.all(color: ColorManager.placeHolderColor),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                // AspectRatio(
                //   aspectRatio: 10 / 9,
                //   child: CustomImage(url: imagePath),
                // ),
                SizedBox(
                    height: 80,
                    child: CustomImage(url: imagePath)),
                const SizedBox(height: 4,),
                Text(
                  imageName,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  textDirection: TextDirection.rtl,
                  overflow: TextOverflow.ellipsis,
                  style: getBoldStyle(color: ColorManager.black),
                ),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                onPressed: onPressedDelete,
                icon: const Icon(
                  Icons.delete,
                  color: ColorManager.error,
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}