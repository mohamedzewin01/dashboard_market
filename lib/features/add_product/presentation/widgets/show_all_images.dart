

import 'package:dashboard_market/core/di/di.dart';
import 'package:dashboard_market/core/resources/cashed_image.dart';
import 'package:dashboard_market/core/resources/color_manager.dart';
import 'package:dashboard_market/core/resources/style_manager.dart';
import 'package:dashboard_market/features/add_images/data/models/images_model.dart';
import 'package:dashboard_market/features/add_images/presentation/manager/images_cubit.dart';
import 'package:dashboard_market/features/add_product/presentation/manager/add_product_cubit.dart';
import 'package:dashboard_market/features/layout/presentation/cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ShowAllImagesToAddProduct extends StatefulWidget {
  const ShowAllImagesToAddProduct({super.key, required this.addProductCubit});

  final AddProductCubit addProductCubit;

  @override
  State<ShowAllImagesToAddProduct> createState() =>
      _ShowAllImagesToAddProductState();
}

class _ShowAllImagesToAddProductState extends State<ShowAllImagesToAddProduct> {
  late ImagesCubit viewModel;
  TextEditingController searchController = TextEditingController();
  List<Images>? allImages = []; // القائمة الكاملة
  List<Images>? filteredImages = []; // القائمة المفلترة

  @override
  void initState() {
    super.initState();
    viewModel = getIt.get<ImagesCubit>();
  }

  void filterImages(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredImages = allImages;
      } else {
        filteredImages = allImages
            ?.where((image) =>
                image.imageName?.toLowerCase().contains(query.toLowerCase()) ??
                false)
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel..fetchImages(),
      child: BlocBuilder<ImagesCubit, ImagesState>(
        builder: (context, state) {
          if (state is SuccessImages) {
            allImages = state.imagesEntity.images?.reversed.toList() ?? [];
            filteredImages =
                filteredImages?.isNotEmpty == true ? filteredImages : allImages;
            return Column(
              children: [

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: searchController,
                    textDirection: TextDirection.rtl, // اتجاه النص من اليمين إلى اليسار
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(

                      hintText: 'ابحث عن صورة...',
                      prefixIcon: const Icon(Icons.search, color: ColorManager.grey),
                      suffixIcon: searchController.text.isNotEmpty
                          ? IconButton(
                        icon: const Icon(Icons.clear, color: ColorManager.grey),
                        onPressed: () {
                          searchController.clear(); // مسح النص
                          filterImages(''); // تحديث القائمة
                        },
                      )
                          : null, // إذا لم يكن هناك نص، لا تعرض الأيقونة
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onChanged: (value) {
                      filterImages(value); // استدعاء الدالة لتحديث القائمة
                    },
                  ),
                ),
                Expanded(
                  child: filteredImages!.isEmpty
                      ? Center(
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'لا توجد صور مطابقة',
                              style: getSemiBoldStyle(
                                  color: ColorManager.orange, fontSize: 24),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            IconButton(
                                onPressed: () {
                                  LayoutCubit.get(context).changeIndex(3);
                                },
                                icon: const CircleAvatar(
                                    backgroundColor: ColorManager.orange,
                                    child: Icon(
                                      Icons.add_a_photo,
                                      color: ColorManager.white,
                                    )))
                          ],
                        ))
                      : GridView.builder(
                          itemCount: filteredImages?.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 6,
                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 5.0,
                            childAspectRatio: 2.5 / 4,
                          ),
                          itemBuilder: (ctx, index) {
                            return GestureDetector(
                              onTap: () {
                                widget.addProductCubit.imagePath =
                                    filteredImages![index].imagePath ?? '';

                                widget.addProductCubit.changeImagePath(
                                  name: filteredImages![index].imageName ?? '' ,
                                    path: filteredImages![index].imagePath ?? '' ,


                                );
                                Navigator.pop(context);
                              },
                              child: Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    CustomImage(
                                      url: "${filteredImages?[index].imagePath}",
                                      height: 110,
                                    ),
                                    Text(
                                      filteredImages?[index].imageName ?? '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),


                ),
              ],
            );
          }
          return const Center(
              child: CircularProgressIndicator(color: ColorManager.orange));
        },
      ),
    );
  }
}
