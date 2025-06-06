import 'package:dashboard_market/core/resources/cashed_image.dart';
import 'package:dashboard_market/core/resources/color_manager.dart';
import 'package:dashboard_market/core/resources/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../../../categories/data/models/fetch_categories.dart';
import '../../../categories/presentation/manager/categories_cubit.dart';
import '../manager/add_product_cubit.dart';

class ChooseCategories extends StatefulWidget {
  const ChooseCategories({
    super.key,
    required this.addProductCubit,
  });

  final AddProductCubit addProductCubit;

  @override
  State<ChooseCategories> createState() => _ChooseCategoriesState();
}

class _ChooseCategoriesState extends State<ChooseCategories> {
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
                labelText: 'القسم',
                labelStyle: const TextStyle(fontSize: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
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
                          SizedBox(
                              height: 35,
                              width: 35,
                              child: CustomImage(
                                  url: entry.value.categoryImage ?? '')),
                          Text(entry.value.categoryName ?? 'غير معروف',style: getSemiBoldStyle(color: ColorManager.black),),
                        ],
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                widget.addProductCubit
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
                borderRadius: BorderRadius.circular(8),
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
