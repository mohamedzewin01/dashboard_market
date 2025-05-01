import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashboard_market/core/di/di.dart';
import 'package:dashboard_market/core/resources/cashed_image.dart';
import 'package:dashboard_market/core/resources/color_manager.dart';
import 'package:dashboard_market/core/resources/style_manager.dart';
import 'package:dashboard_market/core/resources/values_manager.dart';
import 'package:dashboard_market/features/add_product/presentation/manager/ProductPhoto/product_photo_cubit.dart';
import 'package:dashboard_market/features/categories/data/models/fetch_categories.dart';
import 'package:dashboard_market/features/categories/presentation/manager/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ChooseProductImageCategories extends StatefulWidget {
  const ChooseProductImageCategories({
    super.key,
    required this.addImagesCubit,
  });

  final ProductPhotoCubit addImagesCubit;

  @override
  State<ChooseProductImageCategories> createState() => _ChooseProductImageCategoriesState();
}

class _ChooseProductImageCategoriesState extends State<ChooseProductImageCategories> {
  late CategoriesCubit viewModel;

  @override
  void initState() {
    viewModel = getIt.get<CategoriesCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel..getCategoriesData(),
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesSuccess) {
            final List<Categories> categories =
                state.categoriesEntity.categories ?? [];
            if (categories.isEmpty) {
              return const Text('لا توجد بيانات متاحة');
            }
            return DropdownButtonFormField<int>(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(AppSize.s8),
                labelText: 'القسم',
                labelStyle: getSemiBoldStyle(color: ColorManager.orange),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: ColorManager.placeHolderColor),
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: ColorManager.placeHolderColor),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              items: categories
                  .asMap()
                  .entries
                  .map(
                    (entry) => DropdownMenuItem(
                  value: entry.key,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AutoSizeText(
                        entry.value.categoryName ?? 'غير معروف',
                        style: getSemiBoldStyle(color: ColorManager.black),
                      ),
                      SizedBox(
                          height: 35,
                          width: 35,
                          child: CustomImage(
                              url: entry.value.categoryImage ?? '')),
                    ],
                  ),
                ),
              )
                  .toList(),
              onChanged: (value) {
                widget.addImagesCubit
                    .changeCategory(categories[value!].categoryId!);
              },
              validator: (value) {
                if (value == null) {
                  return 'الرجاء اختيار القسم';
                }
                return null;
              },
            );
          }
          return DropdownButtonFormField<int>(
            decoration: InputDecoration(
              labelText: 'القسم',
              labelStyle: const TextStyle(fontSize: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: ColorManager.placeHolderColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: ColorManager.placeHolderColor),
              ),
            ),
            items: const [
              DropdownMenuItem(value: 0, child: Text('غير معروف')),
            ],
            onChanged: (value) {
              // هنا يمكنك إضافة معالج التغيير
            },
            validator: (value) {
              if (value == null) {
                return 'الرجاء اختيار القسم';
              }
              return null;
            },
          );
        },
      ),
    );
  }
}