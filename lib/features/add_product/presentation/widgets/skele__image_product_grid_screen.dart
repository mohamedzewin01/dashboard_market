
import 'package:dashboard_market/core/resources/cashed_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeImagesView extends StatelessWidget {
  const SkeImagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: GridView.builder(
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 3.5 / 4,
        ),
        itemBuilder: (ctx, index) {
          return Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Column(
              children: [
                AspectRatio(
                  aspectRatio:
                  10/9,
                  child: CustomImage(
                      url:
                      "7283resized_1744999920361.jpg"),
                ),
                Text('imageName' ),
              ],
            ),
          );
        },
      ),
    );
  }
}
