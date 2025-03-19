import 'dart:io';

import 'package:dashboard_market/core/di/di.dart';
import 'package:dashboard_market/features/home/presentation/pages/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/resources/cashed_image.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../manager/categories_cubit.dart';
import '../widgets/Add_categories.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  late CategoriesCubit viewModel;

  @override
  void initState() {
    viewModel = getIt.get<CategoriesCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return HomeView();
          } else {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    color: ColorManager.placeHolderColor,
                  ),
                ),
                Expanded(flex: 3, child: AddCategories()),
                Expanded(
                  child: Container(
                    color: ColorManager.placeHolderColor,
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}


