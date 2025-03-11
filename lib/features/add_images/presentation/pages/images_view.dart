import 'dart:developer';
import 'package:dashboard_market/core/resources/color_manager.dart';
import 'package:dashboard_market/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../widgets/add_images.dart';
import '../widgets/constant.dart';

class ImagesView extends StatelessWidget {
  const ImagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: LayoutBuilder(builder: (context, constraints) {
            int crossAxisCount = constraints.maxWidth > 900
                ? 5
                : constraints.maxWidth > 700
                    ? 3
                    : 2;
            log(constraints.maxWidth.toString());
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Expanded(
                        child: AddPicture(
                          urlImage: 'assets/images/image_default.jpg',
                        ),
                      ),
                      const SizedBox(height: AppSize.s24),
                      Expanded(
                        child: Column(
                          children: [
                            SizedBox(height: 25,),
                            CustomTextFormField(
                              controller: TextEditingController(),
                              hintText: 'اسم الصورة',
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: CustomElevatedButton(
                                  buttonColor: ColorManager.primaryColor,
                                  title: 'Update',
                                  onPressed: () {
                                    if (logeImageFile != null) {}
                                  }),
                            ),
                          ],
                        ),
                      ),
                     
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child:  Divider(),
                ),
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) => Container(
                          child:
                              Image.asset('assets/images/image_default.jpg')),
                      childCount: 40),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 1.0,
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
