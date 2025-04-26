import 'package:dashboard_market/core/resources/color_manager.dart';
import 'package:dashboard_market/core/resources/style_manager.dart';
import 'package:dashboard_market/features/categories/data/models/fetch_categories.dart';
import 'package:dashboard_market/features/categories/data/models/products_by_categories_dto.dart';
import 'package:dashboard_market/features/categories/presentation/manager/categories_cubit.dart';
import 'package:dashboard_market/features/categories/presentation/manager/products_by_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product_edit/presentation/pages/edit_product.dart';
import '../../../products/presentation/widgets/products_all_items.dart';
import '../manager/edit_category_cubit.dart';

class CategoriesTapBar extends StatefulWidget {
  const CategoriesTapBar({
    super.key,
    required this.viewModelProductsByCategory,
    required this.viewModel,
  });

  final ProductsByCategoryCubit viewModelProductsByCategory;
  final CategoriesCubit viewModel;

  @override
  State<CategoriesTapBar> createState() => _CategoriesTapBarState();
}

class _CategoriesTapBarState extends State<CategoriesTapBar>
    with TickerProviderStateMixin  {
  TabController? _tabController;
  List<Categories> _categoriesList = [];
  int? _selectedIndex;

  @override
  void dispose() {
    _tabController?.dispose(); // التخلص من TabController عند الخروج
    super.dispose();
  }

  void _updateTabController(int length) {
    if (_tabController == null || _tabController!.length != length) {
      _tabController?.dispose(); // التخلص من TabController القديم
      _tabController = TabController(length: length, vsync: this);
    }
  }

  @override
  Widget build(BuildContext context) {
    EditCategoryCubit cubit = context.read<EditCategoryCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الاقســام',
          style: getBoldStyle(color: Colors.teal, fontSize: 20),
        ),
      ),
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesSuccess) {
            final categoriesList =
                state.categoriesEntity.categories?.reversed.toList() ?? [];
            if (_categoriesList != categoriesList) {
              _categoriesList = categoriesList;
              _updateTabController(_categoriesList.length);
            }

            return LayoutBuilder(builder: (context, constraints) {
              int crossAxisCount = constraints.maxWidth > 900
                  ? 6
                  : constraints.maxWidth > 700
                  ? 4
                  : 3;

              return Column(
                children: [
                  if (_categoriesList.isNotEmpty)
                    Wrap(
                      alignment: WrapAlignment.start,
                      children: _categoriesList.asMap().entries.map((entry) {
                        int index = entry.key;
                        String tabText = entry.value.categoryName ?? "Unknown";
                        String imageUrl = entry.value.categoryImage ?? "";
                        int id = entry.value.categoryId ?? 0;

                        return GestureDetector(
                          onTap: () {
                            cubit.changeNameCategory(tabText, id);
                            cubit.changeImageCategory(imageUrl);

                            setState(() {
                              _selectedIndex = index;
                              _tabController?.animateTo(index);
                              widget.viewModelProductsByCategory
                                  .getProductsByCategory(
                                idCategory: _categoriesList[index].categoryId,
                              );
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            margin: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: _selectedIndex == index
                                  ? Colors.red
                                  : Colors.grey[100],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              tabText,
                              style: getSemiBoldStyle(
                                color: _selectedIndex == index
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  _selectedIndex != null
                      ? Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TabBarView(
                        controller: _tabController,
                        children: _categoriesList.map((category) {
                          return BlocBuilder<ProductsByCategoryCubit,
                              ProductsByCategoryState>(
                            builder: (context, state) {
                              if (state is ProductsByCategorySuccess) {
                                List<ProductsRelations>? filteredProducts =
                                    state
                                        .productsByCategoriesEntity
                                        .productsData
                                        ?.productsRelations ??
                                        [];
                                return CustomScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  slivers: [
                                    SliverToBoxAdapter(
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text(
                                          'عدد المنتجات بالقسم  ${filteredProducts.length}',
                                          style: getBoldStyle(
                                              color: Colors.teal,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                    SliverGrid(
                                      gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: crossAxisCount,
                                        crossAxisSpacing: 16.0,
                                        mainAxisSpacing: 16.0,
                                        childAspectRatio: 1.0,
                                      ),
                                      delegate: SliverChildBuilderDelegate(
                                            (context, index) =>
                                            CustomProductsAllItem(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (_) => EditProduct(
                                                        product:
                                                        filteredProducts[
                                                        index]
                                                            .toProducts()),
                                                  ),
                                                ).then((value) {
                                                  if (value == true) {
                                                    widget
                                                        .viewModelProductsByCategory
                                                        .getProductsByCategory(
                                                        idCategory:
                                                        _categoriesList[
                                                        index]
                                                            .categoryId ??
                                                            0);
                                                  }
                                                });
                                              },
                                              product: filteredProducts[index]
                                                  .toProducts(),
                                            ),
                                        childCount: filteredProducts.length,
                                      ),
                                    ),
                                  ],
                                );
                              }
                              return Center(
                                  child: CircularProgressIndicator(
                                    color: ColorManager.primaryColor,
                                  ));
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  )
                      : Center(
                    heightFactor: 4,
                    child: Text(
                      "قم يتحديد القسم الذي تريده",
                      style:
                      getBoldStyle(color: Colors.teal, fontSize: 20),
                    ),
                  ),
                ],
              );
            });
          }

          return const Center(
            child: Text('حدد القسم'),
          );
        },
      ),
    );
  }
}
