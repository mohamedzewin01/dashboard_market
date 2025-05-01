import 'package:dashboard_market/core/resources/color_manager.dart';
import 'package:dashboard_market/core/resources/values_manager.dart';
import 'package:dashboard_market/core/widgets/custom_elevated_button.dart';
import 'package:dashboard_market/core/widgets/custom_text_form_field.dart';
import 'package:dashboard_market/features/add_product/presentation/manager/ProductPhoto/product_photo_cubit.dart';
import 'package:dashboard_market/features/add_product/presentation/widgets/choose_product_Image_categories.dart';
import 'package:dashboard_market/features/add_product/presentation/widgets/up_load_product_image.dart';
import 'package:flutter/material.dart';

class AddImageProduct extends StatelessWidget {
  const AddImageProduct({super.key, required this.viewModel});
  final ProductPhotoCubit viewModel;


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Form(
            key: viewModel.formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: AppSize.s24),
                  UpLoadProductImage(
                    viewModel: viewModel,
                  ),

                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextFormField(
                    controller: viewModel.nameController,
                    hintText: 'اسم الصورة',
                    validator: (value) {
                      if (value!.trim().isEmpty || value.length < 2) {
                        return 'ادخل اسم الصورة';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ChooseProductImageCategories(addImagesCubit: viewModel,),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomElevatedButton(
                      buttonColor: ColorManager.primaryColor,
                      title: 'اضافة صورة',
                      onPressed: () async {
                        if (viewModel.formKey.currentState!.validate()) {
                          if (viewModel.imageFile != null) {

                            await viewModel.upLoadImages();
                            viewModel.nameController.clear();
                            viewModel.imageFile = null;
                            if (context.mounted) {
                              Navigator.pop(context, true);
                            }
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
