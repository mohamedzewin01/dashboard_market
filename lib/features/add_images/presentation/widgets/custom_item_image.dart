

import 'package:flutter/material.dart';

import '../../../../core/resources/cashed_image.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';

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
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.all(Radius.circular(12)),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          border: Border.all(color: ColorManager.placeHolderColor, width: 1),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                AspectRatio(
                  aspectRatio: 8 / 9,
                  child: CustomImage(url: imagePath),
                ),
                Text(
                  imageName,
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