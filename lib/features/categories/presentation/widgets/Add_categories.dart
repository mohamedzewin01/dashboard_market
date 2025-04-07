import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashboard_market/core/resources/cashed_image.dart';
import 'package:dashboard_market/core/resources/style_manager.dart';
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

class AddCategories extends StatefulWidget {
  const AddCategories({
    super.key,
  });

  @override
  State<AddCategories> createState() => _AddCategoriesState();
}

class _AddCategoriesState extends State<AddCategories> {
  late CategoriesCubit viewModel;

  @override
  void initState() {
    viewModel = getIt.get<CategoriesCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16),
      child: BlocProvider(
        create: (context) => viewModel..getCategoriesData(),
        child: Form(
          key: viewModel.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 16,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: IconButton(
                  onPressed: () async {
                    final XFile? xFile = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (xFile != null) {
                      setState(() {
                        viewModel.imageFile = File(xFile.path);
                        viewModel.imagePath = xFile.path;
                      });
                    }
                  },
                  icon: viewModel.imagePath.isNotEmpty
                      ? Image.file(viewModel.imageFile!)
                      :  const Icon(
                    Icons.add_a_photo_outlined,
                    color: Colors.grey,
                  ),
                ),
              ),
              CustomTextFormField(
                controller: viewModel.categoryNameController,
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
                        if (viewModel.formKey.currentState!.validate()) {
                          if (viewModel.imageFile != null) {
                            viewModel.addCategory();
                            viewModel.getCategoriesData();
                            viewModel.categoryNameController.clear();
                            viewModel.imagePath = '';
                            viewModel.imageFile = null;
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                child: BlocConsumer<CategoriesCubit, CategoriesState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    if (state is CategoriesSuccess) {
                      List<Categories>? allCategories =
                          state.categoriesEntity.categories ?? [];
                      List<Categories>? categories=allCategories.reversed.toList();
                      return GridView.builder(
                        itemCount: categories.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1.5,
                            crossAxisSpacing: 5,
                            // mainAxisExtent: 150,
                            crossAxisCount: 3),
                        itemBuilder: (context, index) => Card(
                          child: Column(
                            children: [
                              AspectRatio(
                                  aspectRatio: 2,
                                  child: CustomImage(
                                      url:
                                          categories[index].categoryImage ?? '')),
                              AutoSizeText(
                                categories[index].categoryName ?? '',
                                style:
                                    getSemiBoldStyle(color: ColorManager.orange),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    return Skeletonizer(
                      child: GridView.builder(
                        itemCount: 5,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                        itemBuilder: (context, index) => Column(
                          children: [
                            CustomImage(
                                url: ' categories[index].imagePath??' ''),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
