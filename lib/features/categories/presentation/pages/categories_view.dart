import 'dart:io';

import 'package:dashboard_market/core/di/di.dart';
import 'package:dashboard_market/core/resources/style_manager.dart';
import 'package:dashboard_market/features/categories/data/models/fetch_categories.dart';
import 'package:dashboard_market/features/home/presentation/pages/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/resources/cashed_image.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
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

  @override
  void initState() {
    viewModel = getIt.get<CategoriesCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel..getCategoriesData(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            LayoutCubit.get(context).changeIndex(0);
          } else {
            return Row(
              children: [

                Expanded(flex: 1, child: AddCategories()),
                Expanded(
                  flex: 2,
                  child: MultiLineTabBarExample(),
                )
              ],
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}






class MultiLineTabBarExample extends StatefulWidget {
  const MultiLineTabBarExample({super.key});

  @override
  _MultiLineTabBarExampleState createState() => _MultiLineTabBarExampleState();
}

class _MultiLineTabBarExampleState extends State<MultiLineTabBarExample>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  List<Categories> _categoriesList = [];

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  void _updateTabController(int length) {
    if (_tabController?.length != length) {
      _tabController?.dispose();
      _tabController = TabController(length: length, vsync: this);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('الاقســام',style: getBoldStyle(color: Colors.teal,fontSize: 20),),
      ),
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesSuccess) {
            _categoriesList =
                state.categoriesEntity.categories?.reversed.toList() ?? [];
            _updateTabController(_categoriesList.length);

            return Column(
              children: [
                // Custom Multi-Line TabBar
                if (_categoriesList.isNotEmpty)
                  Wrap(
                    alignment: WrapAlignment.start,
                    children: _categoriesList.asMap().entries.map((entry) {
                      int index = entry.key;
                      String tabText = entry.value.categoryName ?? "Unknown";

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _tabController?.animateTo(index);
                          });

                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: _tabController?.index == index
                                ? Colors.red
                                : Colors.grey[100],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            tabText,
                            style:getSemiBoldStyle(color: _tabController?.index == index
                                ? Colors.white
                                : Colors.black,
                            fontSize: 16
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                // TabBarView
                Expanded(
                  child: _categoriesList.isNotEmpty
                      ? TabBarView(
                    controller: _tabController,
                    children: _categoriesList.map((category) {
                      return Center(
                        child: Text(
                          '${category.categoryName}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      );
                    }).toList(),
                  )
                      : const Center(
                    child: Text("No categories available"),
                  ),
                ),
              ],
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}



