import 'package:dashboard_market/features/add_images/presentation/widgets/choose_image_category.dart';
import 'package:flutter/material.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../manager/images_cubit.dart';
import 'upLoad_image.dart';

class SectionUploadImages extends StatelessWidget {
  const SectionUploadImages({
    super.key,
    required this.viewModel,
  });

  final ImagesCubit viewModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UpLoadImage(
          viewModel: viewModel,
        ),
        const SizedBox(height: AppSize.s24),
        Expanded(
          child: Form(
            key: viewModel.formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                CustomTextFormField(
                  controller: viewModel.nameController,
                  hintText: 'اسم الصورة',
                  validator: (value) {
                    if (value!.trim().isEmpty || value.length < 6) {
                      return 'ادخل اسم الصورة';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                ChooseImageCategories(addImagesCubit: viewModel,),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomElevatedButton(
                    buttonColor: ColorManager.primaryColor,
                    title: 'Update',
                    onPressed: () async {
                      if (viewModel.formKey.currentState!.validate()) {
                        if (viewModel.imageFile != null) {
                          await viewModel.upLoadImages();
                          viewModel.imageFile = null;
                          await viewModel.fetchImages();
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
