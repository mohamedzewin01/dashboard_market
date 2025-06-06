
import 'package:dashboard_market/core/di/di.dart';
import 'package:dashboard_market/features/categories/presentation/manager/edit_category_cubit.dart';
import 'package:dashboard_market/features/categories/presentation/manager/products_by_category_cubit.dart';
import 'package:dashboard_market/features/categories/presentation/widgets/categories_tap_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/presentation/cubit/layout_cubit.dart';
import '../manager/categories_cubit.dart';
import '../widgets/Add_categories.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  late CategoriesCubit viewModel;
  late ProductsByCategoryCubit viewModelProductsByCategory;
  late EditCategoryCubit viewModelEditCategory;

  @override
  void initState() {
    viewModel = getIt.get<CategoriesCubit>();
    viewModelProductsByCategory = getIt.get<ProductsByCategoryCubit>();
    viewModelEditCategory = getIt.get<EditCategoryCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: viewModel..getCategoriesData(),
        ),
        BlocProvider(
          create: (context) => viewModelProductsByCategory,
        ),
        BlocProvider(
          create: (context) => viewModelEditCategory,
        ),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            LayoutCubit.get(context).changeIndex(0);
          } else {
            return Row(
              children: [
                Expanded(child: AddCategories(viewModel: viewModel,)),
                Expanded(
                  flex: 2,
                  child: CategoriesTapBar(
                    viewModelProductsByCategory: viewModelProductsByCategory,
                    viewModel: viewModel,
                  ),
                )
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
