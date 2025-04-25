import 'dart:io';

import 'package:dashboard_market/core/resources/cashed_image.dart';
import 'package:dashboard_market/core/resources/color_manager.dart';
import 'package:dashboard_market/core/resources/style_manager.dart';
import 'package:dashboard_market/core/widgets/custom_dialog.dart';
import 'package:dashboard_market/core/widgets/custom_elevated_button.dart';
import 'package:dashboard_market/core/widgets/custom_text_form_field.dart';
import 'package:dashboard_market/features/categories/presentation/manager/categories_cubit.dart';
import 'package:dashboard_market/features/categories/presentation/manager/edit_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EditCategory extends StatefulWidget {
  const EditCategory({
    super.key, required this.viewModelCategories,
  });
final CategoriesCubit viewModelCategories;
  @override
  State<EditCategory> createState() => _EditCategoryState();
}

class _EditCategoryState extends State<EditCategory> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditCategoryCubit, EditCategoryState>(
      listener: (context, state) {
        if (state is EditCategorySuccess) {

          CustomDialog.showSuccessDialog(context,message: "تم التعديل بنجاح");
          widget.viewModelCategories.getCategoriesData();
        }
      },
      builder: (context, state) {
        EditCategoryCubit viewModel = context.read<EditCategoryCubit>();
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: viewModel.formKeyEdit,
            child: SingleChildScrollView(
              child: Column(
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: IconButton(
                      splashColor: Colors.transparent,
                      onPressed: () {},
                      highlightColor: Colors.transparent,
                      mouseCursor: SystemMouseCursors.click,
                      icon: viewModel.imagePathEdit.isNotEmpty&&viewModel.imageFileEdit==null
                          ? Tooltip(
                        message: " اضغط على صورة لاختيار صورة اخرى",
                        textStyle: getSemiBoldStyle(color: ColorManager.white, fontSize: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: ColorManager.error,
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            final XFile? xFile = await ImagePicker()
                                .pickImage(source: ImageSource.gallery);
                            if (xFile != null) {
                              setState(() {
                                viewModel.imageFileEdit = File(xFile.path);
                                viewModel.imagePathEdit = xFile.path;
                              });
                            }
                          },
                          child: AspectRatio(
                            aspectRatio: 20 / 9,
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              width: double.infinity, // Take full width
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child:
                              CustomImage(url: viewModel.imagePathEdit),
                            ),
                          ),
                        ),
                      )
                          : viewModel.imageFileEdit==null?Tooltip(
                        message:
                        "اختر القسم الاول من القائمة لتظهر صورته حتي يمكنك التعديل",
                        textStyle: getSemiBoldStyle(color: ColorManager.white, fontSize: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: ColorManager.error,
                        ),
                        child: Container(
                          height: 150,
                          width: double.infinity, // Take full width
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: Colors.grey[400]!),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.image_outlined,
                                  size: 50, color: Colors.grey[600]),
                              const SizedBox(height: 8),
                              Text(
                                'Upload product image',
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'PNG, JPG up to 5MB',
                                style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ): AspectRatio(
                          aspectRatio: 20 / 9,
                          child: Image.file(viewModel.imageFileEdit!)),
                    ),
                  ),
                  CustomTextFormField(
                    controller: viewModel.editCategoryNameController,
                    validator: (value) {
                      if (value!.trim().isEmpty) return 'ادخل اسم المنتج';
                      if (value.trim().length < 3) return 'الاسم قصير جدا';
                      return null;
                    },
                    labelText: "اسم المنتج",
                    hintText: "اسم المنتج",
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomElevatedButton(
                          buttonColor: ColorManager.orange,
                          title: 'تعديل',
                          onPressed: () {

                            if (viewModel.formKeyEdit.currentState!
                                .validate()) {

                              viewModel.editCategory(idCategory:45  );

                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}