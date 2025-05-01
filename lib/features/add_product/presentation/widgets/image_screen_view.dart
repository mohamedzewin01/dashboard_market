import 'package:dashboard_market/core/di/di.dart';
import 'package:dashboard_market/core/resources/color_manager.dart';
import 'package:dashboard_market/core/widgets/custom_dialog.dart';
import 'package:dashboard_market/core/widgets/custom_item_image.dart';
import 'package:dashboard_market/features/add_product/data/models/images_dto.dart';
import 'package:dashboard_market/features/add_product/presentation/manager/ProductPhoto/product_photo_cubit.dart';
import 'package:dashboard_market/features/add_product/presentation/manager/add_product_cubit.dart';
import 'package:dashboard_market/features/add_product/presentation/widgets/show_image_picker_bottom_sheet.dart';
import 'package:dashboard_market/features/add_product/presentation/widgets/skele__image_product_grid_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ImageScreenView extends StatefulWidget {
  const ImageScreenView({super.key});

  @override
  State<ImageScreenView> createState() => _ImageScreenViewState();
}

class _ImageScreenViewState extends State<ImageScreenView> {
  late ProductPhotoCubit viewModel;

  @override
  void initState() {
    viewModel = getIt.get<ProductPhotoCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel..fetchImages(),
      child: ImageProductGridScreen(
        viewModel: viewModel,
      ),
    );
  }
}

class ImageProductGridScreen extends StatefulWidget {
  const ImageProductGridScreen({super.key, required this.viewModel});

  final ProductPhotoCubit viewModel;

  @override
  State<ImageProductGridScreen> createState() => _ImageProductGridScreenState();
}

class _ImageProductGridScreenState extends State<ImageProductGridScreen> {
  TextEditingController searchController = TextEditingController();
  List<AllImages>? allImages = [];
  // List<AllImages>? filteredImages = [];

  void filterImages(String query) {
    setState(() {
      if (query.isEmpty) {
        widget.viewModel.filteredImages = allImages;
      } else {
        widget.viewModel. filteredImages = allImages
            ?.where((image) =>
                image.imageName?.toLowerCase().contains(query.toLowerCase()) ??
                false)
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocBuilder<ProductPhotoCubit, ProductPhotoState>(
          builder: (context, state) {
            if (state is ProductPhotoSuccess) {
              allImages = state.allImagesEntity.images?.reversed.toList();
              widget.viewModel.filteredImages =   widget.viewModel.filteredImages?.isNotEmpty == true
                  ?   widget.viewModel.filteredImages
                  : allImages;
              return Column(
                children: [
                  Row(
                    children: [
                      Tooltip(
                        message: 'إضافة صورة',
                        child: IconButton(
                          icon: const Icon(
                            Icons.image,
                            color: ColorManager.grey,
                          ),
                          onPressed: () async {
                            final result = await showImagePickerBottomSheet(context, widget.viewModel);
                            if (result == true) {
                              await widget.viewModel.fetchImages();
                            }
                          },
                        ),
                      ),

                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 8.0),
                          child: TextField(
                            controller: searchController,
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                              hintText: 'ابحث عن صورة...',
                              prefixIcon: const Icon(Icons.search,
                                  color: ColorManager.grey),
                              suffixIcon: searchController.text.isNotEmpty
                                  ? IconButton(
                                      icon: const Icon(Icons.clear,
                                          color: ColorManager.grey),
                                      onPressed: () {
                                        searchController.clear();
                                        filterImages('');
                                      },
                                    )
                                  : null,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onChanged: (value) {
                              filterImages(value);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: GridView.builder(
                      itemCount:   widget.viewModel.filteredImages?.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 6,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                        mainAxisExtent: 120,
                        // childAspectRatio: 2.0 / 3.5,
                      ),
                      itemBuilder: (ctx, index) {
                        return InkWell(
                            mouseCursor: SystemMouseCursors.click,
                            splashColor: ColorManager.orange.withAlpha(100),
                            focusColor: ColorManager.orange.withAlpha(100),
                            onTap: () {
                              AddProductCubit.get(context).imagePath =
                                    widget.viewModel.filteredImages?[index].imagePath ?? '';
                              AddProductCubit.get(context).changeImagePath(
                                name:widget.viewModel.filteredImages?[index].imageName ?? '',
                                    path:widget.viewModel.filteredImages?[index].imagePath ?? '' );

                            },
                            child: CustomItemImage(
                                imageName:
                                      widget.viewModel.filteredImages?[index].imageName ?? '',
                                imagePath:
                                      widget.viewModel.filteredImages?[index].imagePath ?? '',
                                onPressedDelete: () {
                                  CustomDialog.showDoubleConfirmationDialog(
                                    context,
                                    imageUrl:
                                          widget.viewModel.filteredImages?[index].imagePath ?? '',
                                    onDeleteConfirmed: () async {
                                      await widget.viewModel
                                          .deleteProductImages(
                                          widget.viewModel.filteredImages?[index]
                                                .idImage
                                                .toString() ??
                                            '',
                                          widget.viewModel.filteredImages?[index].imagePath ?? '',
                                      );
                                        widget.viewModel.filteredImages?.removeAt(index);
                                    },
                                  );
                                })

                            // ClipRRect(
                            //   borderRadius: BorderRadius.circular(10),
                            //   child: Container(
                            //     clipBehavior: Clip.antiAlias,
                            //     decoration: BoxDecoration(
                            //       border: Border.all(color: Colors.grey),
                            //       borderRadius: BorderRadius.circular(10),
                            //     ),
                            //     child: Stack(
                            //       children: [
                            //         Column(
                            //           children: [
                            //             Padding(
                            //               padding: const EdgeInsets.all(3),
                            //               child: CustomImage(
                            //                 url:
                            //                     "${  widget.viewModel.filteredImages?[index].imagePath}",
                            //                 height: 110,
                            //               ),
                            //             ),
                            //             Text(
                            //               filteredImages?[index].imageName ?? '',
                            //               style:
                            //                   getSemiBoldStyle(color: Colors.black),
                            //               maxLines: 1,
                            //               overflow: TextOverflow.ellipsis,
                            //             ),
                            //           ],
                            //         ),
                            //
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            );
                      },
                    ),
                  ),
                ],
              );
            }
            return const SkeImagesView();
          },
        ),
      ),
    );
  }
}
