import 'package:dashboard_market/core/di/di.dart';
import 'package:dashboard_market/core/resources/cashed_image.dart';
import 'package:dashboard_market/core/resources/color_manager.dart';
import 'package:dashboard_market/core/resources/style_manager.dart';
import 'package:dashboard_market/core/resources/values_manager.dart';
import 'package:dashboard_market/features/product_edit/data/models/response/fetch_categories.dart';
import 'package:dashboard_market/features/product_edit/presentation/manager/category_cubit/product_categories_edit_cubit.dart';
import 'package:dashboard_market/features/product_edit/presentation/manager/edit_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeCategories extends StatefulWidget {
  const ChangeCategories({
    super.key,
    required this.categoryId,
  });

  final int? categoryId;

  @override
  State<ChangeCategories> createState() => _ChangeCategoriesState();
}

class _ChangeCategoriesState extends State<ChangeCategories> {
  late ProductCategoriesEditCubit viewModel;

  @override
  void initState() {
    viewModel = getIt.get<ProductCategoriesEditCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel..getCategoriesToEdit(),
      child:
          BlocBuilder<ProductCategoriesEditCubit, ProductCategoriesEditState>(
        builder: (context, state) {
          if (state is ProductCategoriesEditSuccess) {
            final List<CategoriesEdit> categories =
                state.fetchCategoriesEditEntity.categories?.reversed.toList() ??
                    [];
            return  DropdownButtonFormField<int>(
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
                  .map(
                    (category) => DropdownMenuItem<int>(
                  value: category.categoryId, // نفترض أن الفئة لديها معرف `id`
                  child: Row(
                    children: [
                      SizedBox(
                        height: 35,
                        width: 35,
                        child: CustomImage(
                          url: category.categoryImage ?? '',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        category.categoryName ?? 'غير معروف',
                        style: getSemiBoldStyle(color: ColorManager.black),
                      ),
                    ],
                  ),
                ),
              )
                  .toList(),
              value: widget.categoryId, // ضبط القيمة الافتراضية بناءً على `categoryId`
              onChanged: (value) {
                EditProductCubit.get(context).selectedCategoryId = value;
              },
            );

          }
          return Center(
            child: DropdownButtonFormField<String>(
              items: [
                DropdownMenuItem(
                  value: '1',
                  child: Text(
                    'نعم',
                    style: getSemiBoldStyle(
                        color: ColorManager.black, fontSize: 16),
                    textDirection: TextDirection.rtl,
                  ),
                ),
                DropdownMenuItem(
                  value: '2',
                  child: Text(
                    'محمد',
                    style: getSemiBoldStyle(
                        color: ColorManager.black, fontSize: 16),
                    textDirection: TextDirection.rtl,
                  ),
                ),
                DropdownMenuItem(
                  value: '3',
                  child: Text(
                    'السيد',
                    style: getSemiBoldStyle(
                        color: ColorManager.black, fontSize: 16),
                    textDirection: TextDirection.rtl,
                  ),
                ),
                DropdownMenuItem(
                  value: '4',
                  child: Text(
                    'المتولي',
                    style: getSemiBoldStyle(
                        color: ColorManager.black, fontSize: 16),
                    textDirection: TextDirection.rtl,
                  ),
                ),
                DropdownMenuItem(
                  value: '5',
                  child: Text(
                    'زوين',
                    style: getSemiBoldStyle(
                        color: ColorManager.black, fontSize: 16),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ],
              onChanged: (value) {},
            ),
          );
        },
      ),
    );
  }
}
