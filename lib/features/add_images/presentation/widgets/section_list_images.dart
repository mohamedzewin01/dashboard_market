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
                        onPressedDelete: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              title: Row(
                                children: [
                                  Icon(Icons.warning_rounded, color: Colors.red, size: 28),
                                  SizedBox(width: 8),
                                  Text(
                                    'تأكيد الحذف',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                              content: Text(
                                'هل أنت متأكد من حذف الصورة؟',
                                style: TextStyle(fontSize: 16, color: Colors.black54),
                              ),
                              actionsAlignment: MainAxisAlignment.spaceBetween,
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text(
                                    'إلغاء',
                                    style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () async {
                                    await viewModel.deleteImages(
                                      listImage[index].idImage.toString(),
                                      listImage[index].imageName.toString(),
                                    );
                                    if (context.mounted) {
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: Text(
                                    'حذف',
                                    style: TextStyle(fontSize: 16, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          );

                        });
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
