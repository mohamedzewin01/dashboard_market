import 'dart:math';

import 'package:dashboard_market/core/resources/app_constants.dart';
import 'package:dashboard_market/core/resources/color_manager.dart';
import 'package:dashboard_market/core/widgets/custom_elevated_button.dart';
import 'package:dashboard_market/core/widgets/custom_text_form_field.dart';
import 'package:dashboard_market/features/banners/presentation/cubit/add_banners_cubit/add_banners_cubit.dart';
import 'package:dashboard_market/features/banners/presentation/widgets/switch_status_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AddBannerBody extends StatelessWidget {
  const AddBannerBody({super.key, required this.viewModel});

  final AddBannersCubit viewModel;

  @override
  Widget build(BuildContext context) {
    final Random random = Random();
    return BlocBuilder<AddBannersCubit, AddBannersState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Form(
            key: viewModel.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 24,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: AspectRatio(
                    aspectRatio: 4.5,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 48,
                          decoration: BoxDecoration(
                            color: AppConstants.colors[
                                random.nextInt(AppConstants.colors.length)],
                          ),
                          child: Row(
                            children: [
                              viewModel.imageFile != null
                                  ? Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(18),
                                            bottomLeft: Radius.circular(18),
                                          ),
                                          color: Colors.green,
                                          image: DecorationImage(
                                            image:
                                                FileImage(viewModel.imageFile!),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(18),
                                            bottomLeft: Radius.circular(18),
                                          ),
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Text(
                                      viewModel.bannerTitleController.text,
                                      maxLines: 1,
                                      textDirection: TextDirection.rtl,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontFamily: GoogleFonts.cairo(
                                          fontWeight: FontWeight.w900,
                                        ).fontFamily,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Text(
                                      viewModel.bannerSubTitleController.text,
                                      maxLines: 1,
                                      textDirection: TextDirection.rtl,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontFamily: GoogleFonts.cairo(
                                          fontWeight: FontWeight.w900,
                                        ).fontFamily,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 0,
                          // right: 0,
                          left: 0,
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 15,
                            child: Text(
                              AppConstants.actionString[random
                                  .nextInt(AppConstants.actionString.length)],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: viewModel.pickImageBanner,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: ColorManager.primaryColor, width: 3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(0),
                      clipBehavior: Clip.antiAlias,
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.add_a_photo_outlined,
                        color: ColorManager.grey,
                      ),
                    ),
                  ),
                ),
                CustomTextFormField(
                  maxLength: 15,
                  hintText: 'العنوان',
                  controller: viewModel.bannerTitleController,
                  onChanged: (value) {
                    viewModel.changeTitle(value);
                  },
                ),
                CustomTextFormField(
                    maxLength: 15,
                    controller: viewModel.bannerSubTitleController,
                    hintText: 'العنوان الفرعي',
                    onChanged: (value) {
                      viewModel.changeSubTitle(value);
                    }),
                SwitchStatusBanner(
                  value: viewModel.status==1,
                  onChanged: (value) {

                    viewModel.changeStatus(value);
                  },
                ),
                CustomElevatedButton(
                  title: 'حفظ',
                  onPressed: () {
                    viewModel.addBanners();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
