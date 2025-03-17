import 'package:dashboard_market/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/categories_cubit.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  late CategoriesCubit viewModel;
  @override
  void initState() {
   viewModel=getIt.get<CategoriesCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel,
      child: Column(
        children: [
          Text('categories')
        ],
      ),
    );
  }
}
