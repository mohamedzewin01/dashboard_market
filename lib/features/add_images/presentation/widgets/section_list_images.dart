
import 'package:flutter/material.dart';

import '../../data/models/images_model.dart';
import '../manager/images_cubit.dart';
import 'custom_item_image.dart';

class SectionListImages extends StatelessWidget {
  const SectionListImages(
      {super.key,
        required this.crossAxisCount,
        required this.listImage,
        required this.viewModel});

  final int crossAxisCount;
  final List<Images> listImage;
  final ImagesCubit viewModel;

  @override
  Widget build(BuildContext context) {
    return listImage.isNotEmpty
        ? Expanded(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return CustomItemImage(
                imageName: listImage[index].imageName ?? '',
                imagePath: listImage[index].imagePath ?? '',
                onPressedDelete: () => viewModel.deleteImages(
                    listImage[index].idImage.toString(),
                    listImage[index].imageName.toString()),
              );
            }, childCount: listImage.length),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.8,
            ),
          ),
        ],
      ),
    )
        : Center(
      child: Text('لا يوجد صور'),
    );
  }
}