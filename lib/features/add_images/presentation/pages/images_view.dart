import 'dart:developer';
import 'package:dashboard_market/core/di/di.dart';
import 'package:dashboard_market/core/resources/cashed_image.dart';
import 'package:dashboard_market/core/resources/color_manager.dart';
import 'package:dashboard_market/core/resources/style_manager.dart';
import 'package:dashboard_market/core/widgets/custom_text_form_field.dart';
import 'package:dashboard_market/features/add_images/presentation/manager/images_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../widgets/add_images.dart';
import '../widgets/constant.dart';

class ImagesView extends StatefulWidget {
  const ImagesView({super.key});

  @override
  State<ImagesView> createState() => _ImagesViewState();
}

class _ImagesViewState extends State<ImagesView> {
  late ImagesCubit viewModel;

  @override
  void initState() {
    viewModel = getIt.get<ImagesCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel..fetchImages(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: LayoutBuilder(builder: (context, constraints) {
              int crossAxisCount = constraints.maxWidth > 900
                  ? 6
                  : constraints.maxWidth > 700
                      ? 4
                      : 3;
              log(constraints.maxWidth.toString());
              return BlocBuilder<ImagesCubit, ImagesState>(
                builder: (context, state) {
                  if (state is SuccessImages) {
                    var listImage = state.imagesEntity.images?.reversed.toList();
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: UpLoadImage(
                                viewModel: viewModel,
                              ),
                            ),
                            const SizedBox(height: AppSize.s24),
                            Expanded(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 25,
                                  ),
                                  CustomTextFormField(
                                    controller: viewModel.nameController,
                                    hintText: 'اسم الصورة',
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: CustomElevatedButton(
                                        buttonColor: ColorManager.primaryColor,
                                        title: 'Update',
                                        onPressed: () async {
                                          if (viewModel.imageFile != null) {
                                            await viewModel.upLoadImages();
                                            viewModel.imageFile = null;
                                            await viewModel.fetchImages();
                                          }
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Expanded(
                          child: CustomScrollView(
                            slivers: [
                              SliverGrid(
                                delegate: SliverChildBuilderDelegate(
                                    (context, index) {



                                      return Container(
                                        child: Column(
                                          children: [
                                            AspectRatio(
                                              aspectRatio: 9 / 9,
                                              child: CustomImage(
                                                  url: listImage?[index]
                                                      .imagePath ??
                                                      ''),
                                            ),
                                            Text(
                                              listImage?[index]
                                                  .imageName ??
                                                  '',
                                              style: getBoldStyle(
                                                  color: ColorManager.black),
                                            ),
                                          ],
                                        ),
                                      );
                                    } ,
                                    childCount:
                                        state.imagesEntity.images?.length),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: crossAxisCount,
                                  crossAxisSpacing: 8.0,
                                  mainAxisSpacing: 8.0,
                                  childAspectRatio: 0.8,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                  // return CustomScrollView(
                  //   slivers: [
                  //     SliverToBoxAdapter(
                  //       child: Row(
                  //         children: [
                  //           Expanded(
                  //             child: UpLoadImage(
                  //              viewModel: viewModel,
                  //             ),
                  //           ),
                  //           const SizedBox(height: AppSize.s24),
                  //           Expanded(
                  //             child: Column(
                  //               children: [
                  //                 SizedBox(
                  //                   height: 25,
                  //                 ),
                  //                 CustomTextFormField(
                  //                   controller: TextEditingController(),
                  //                   hintText: 'اسم الصورة',
                  //                 ),
                  //                 Padding(
                  //                   padding: const EdgeInsets.all(16.0),
                  //                   child: CustomElevatedButton(
                  //                       buttonColor: ColorManager.primaryColor,
                  //                       title: 'Update',
                  //                       onPressed: () {
                  //                         if (logeImageFile != null) {}
                  //                       }),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     SliverToBoxAdapter(
                  //       child: Divider(),
                  //     ),
                  //     SliverGrid(
                  //       delegate: SliverChildBuilderDelegate(
                  //           (context, index) => Skeletonizer(
                  //                 child: Container(
                  //                     child: Image.asset(
                  //                         'assets/images/image_default.jpg')),
                  //               ),
                  //           childCount: 40),
                  //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //         crossAxisCount: crossAxisCount,
                  //         crossAxisSpacing: 8.0,
                  //         mainAxisSpacing: 8.0,
                  //         childAspectRatio: 1.0,
                  //       ),
                  //     ),
                  //   ],
                  // );

                  return Center(child: CircularProgressIndicator());
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}
