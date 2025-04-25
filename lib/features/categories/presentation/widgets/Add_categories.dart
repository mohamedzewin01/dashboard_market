import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashboard_market/core/resources/cashed_image.dart';
import 'package:dashboard_market/core/resources/style_manager.dart';
import 'package:dashboard_market/features/categories/presentation/manager/edit_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/di/di.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../data/models/fetch_categories.dart';
import '../manager/categories_cubit.dart';
import 'edit_category.dart';

class AddCategories extends StatefulWidget {
  const AddCategories({
    super.key, required this.viewModel,
  });
  final CategoriesCubit viewModel;
  @override
  State<AddCategories> createState() => _AddCategoriesState();
}

class _AddCategoriesState extends State<AddCategories> {
  // late CategoriesCubit viewModel;
  //
  // @override
  // void initState() {
  //   viewModel = getIt.get<CategoriesCubit>();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16),
      child: BlocProvider(
        create: (context) => widget.viewModel..getCategoriesData(),
        child: Form(
          key: widget.viewModel.formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 16,
              children: [
                SizedBox(
                  child: IconButton(
                    onPressed: () async {
                      final XFile? xFile = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (xFile != null) {
                        setState(() {
                          widget.viewModel.imageFile = File(xFile.path);
                          widget.viewModel.imagePath = xFile.path;
                        });
                      }
                    },
                    icon: widget.viewModel.imagePath.isNotEmpty
                        ? AspectRatio(
                            aspectRatio: 20 / 9,
                            child: Image.file(widget.viewModel.imageFile!))
                        : Container(
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
                                      color: Colors.grey[600], fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                  ),
                ),
                CustomTextFormField(
                  controller: widget.viewModel.categoryNameController,
                  validator: (value) {
                    if (value!.trim().isEmpty) return 'ادخل اسم القسم';
                    if (value.trim().length < 3) return 'الاسم قصير جدا';
                    return null;
                  },
                  labelText: "اسم القسم",
                  hintText: "اسم القسم",
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        buttonColor: ColorManager.orange,
                        title: 'اضافة',
                        onPressed: () {
                          if (widget.viewModel.formKey.currentState!.validate()) {
                            if (widget.viewModel.imageFile != null) {
                              widget.viewModel.addCategory();
                              widget.viewModel.getCategoriesData();
                              widget.viewModel.categoryNameController.clear();
                              widget.viewModel.imagePath = '';
                              widget.viewModel.imageFile = null;
                            }
                          }
                        },
                      ),
                    ),
                  ],
                ),
                EditCategory(viewModelCategories: widget.viewModel,)
              ],
            ),
          ),
        ),
      ),
    ));
  }
}


