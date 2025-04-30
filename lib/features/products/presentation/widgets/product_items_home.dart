import 'package:dashboard_market/core/resources/style_manager.dart';
import 'package:dashboard_market/features/product_edit/presentation/pages/edit_product.dart';
import 'package:dashboard_market/features/products/presentation/cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_text_form_field.dart';
import 'package:dashboard_market/features/products/data/models/response/AllProductsResponse.dart';
import 'products_all_items.dart';

class ProductItemsHome extends StatefulWidget {
  const ProductItemsHome({
    super.key,
    required this.viewModel,
    this.products,
    required this.totalProducts,
  });

  final ProductsCubit viewModel;
  final num totalProducts;
  final List<Products>? products;

  @override
  State<ProductItemsHome> createState() => _ProductItemsHomeState();
}

class _ProductItemsHomeState extends State<ProductItemsHome> {
  late ScrollController _scrollController;
  late TextEditingController _searchController;
  bool showScrollToTopButton = false;
  String query = "";
  bool isLoadingMore = false;
  bool selectAll = false;
  List<Products>? filteredProducts = [];

  @override
  void initState() {
    filteredProducts = widget.products;
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
    _searchController = TextEditingController();
    widget.viewModel.getLimitAllProducts(isFirstFetch: true);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 300 &&
        !isLoadingMore) {
      setState(() => isLoadingMore = true);
      _fetchProductsByTab().then((_) {
        setState(() => isLoadingMore = false);
      });
    }

    if (_scrollController.position.pixels > 300) {
      if (!showScrollToTopButton) {
        setState(() {
          showScrollToTopButton = true;
        });
      }
    } else {
      if (showScrollToTopButton) {
        setState(() {
          showScrollToTopButton = false;
        });
      }
    }
  }

  Future<void> _fetchProductsByTab() async {
    final cubit = context.read<ProductsCubit>();
    switch (widget.viewModel.tabController.index) {
      case 0:
        await cubit.getLimitAllProducts();
        break;
      case 1:
        await widget.viewModel.getLimitProductsActive();
        break;
      case 2:
        await widget.viewModel.getLimitProductsNotActive();
        break;
      case 3:
        await widget.viewModel.getLimitProductsDiscount();
        break;
      case 4:
        await widget.viewModel.getLimitProductsNotDiscount();
        break;
      default:
        break;
    }
  }

  void _updateSearch(String searchQuery) {
    setState(() {
      query = searchQuery;
      filteredProducts = widget.products
          ?.where((product) => product.productName!
              .toLowerCase()
              .contains(searchQuery.toLowerCase()))
          .toList();
    });
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final int crossAxisCount = constraints.maxWidth > 900
              ? 5
              : constraints.maxWidth > 700
                  ? 3
                  : 2;
          return Stack(
            children: [
              Column(
                children: [
                  RepaintBoundary(
                    child: Row(
                      children: [
                        if (crossAxisCount > 2)
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text.rich(
                                  TextSpan(children: [
                                    TextSpan(
                                      text: 'عدد المنتجات: ',
                                      style: getSemiBoldStyle(
                                          color:Colors.black),
                                    ),
                                    TextSpan(
                                      text: '${widget.totalProducts}',
                                      style:
                                          getSemiBoldStyle(color: Colors.blueAccent),
                                    ),
                                  ]),
                                ),
                                // IconButton(
                                //   icon: Icon(Icons.check_circle_outline),
                                //   onPressed: () {
                                //     setState(() {
                                //       selectAll = !selectAll;
                                //       selectAll
                                //           ? ProductsSelected.selectAllProduct(products: filteredProducts!)
                                //           : ProductsSelected.cancelSelect();
                                //     });
                                //   },
                                // ),
                                // IconButton(
                                //   icon: Icon(Icons.local_offer),
                                //   onPressed: () {
                                //     setState(() {
                                //       selectAll = !selectAll;
                                //       selectAll
                                //           ? ProductsSelected.setProductsWithDiscount(products: filteredProducts!)
                                //           : ProductsSelected.cancelSelect();
                                //     });
                                //   },
                                // ),
                              ],
                            ),
                          )
                        else
                          const SizedBox(width: 16),
                        Expanded(
                          flex: 2,
                          child: CustomSearchTextFormField(
                            hintText: 'ابحث عن المنتجات ...',
                            prefixIcon: const Icon(Icons.search),
                            controller: _searchController,
                            onChanged: (value) {
                              _updateSearch(value);
                            },
                          ),
                        ),
                        if (crossAxisCount > 2)
                          const Spacer()
                        else
                          const SizedBox(width: 16),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: BlocBuilder<ProductsCubit, ProductsState>(
                      builder: (context, state) {
                        List<Products> products = [];

                        if (state is ProductsSuccess) {
                          products = state.productsEntity?.products ?? [];
                        }

                        if (state is ProductsDiscountSuccess) {
                          products = state.productsEntity?.products ?? [];
                        }

                        if (state is ProductsNotDiscountSuccess) {
                          products = state.productsEntity?.products ?? [];
                        }

                        if (state is ProductsActiveSuccess) {
                          products = state.productsEntity?.products ?? [];
                        }

                        if (state is ProductsNotActiveSuccess) {
                          products = state.productsEntity?.products ?? [];
                        }

                        final filteredProducts = query.isEmpty
                            ? products
                            : products
                                .where((product) =>
                                    product.productName
                                        ?.toLowerCase()
                                        .contains(query.toLowerCase()) ??
                                    false)
                                .toList();

                        if (state is ProductsLoading && products.isEmpty) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        if (state is ProductsDiscountFail) {
                          return const Center(
                              child: Text('حدث خطأ أثناء تحميل المنتجات'));
                        }

                        if (filteredProducts.isEmpty) {
                          return const Center(child: Text('لا توجد منتجات'));
                        }

                        return CustomScrollView(
                          controller: _scrollController,
                          slivers: [
                            SliverGrid(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount,
                                crossAxisSpacing: 16.0,
                                mainAxisSpacing: 16.0,
                              ),
                              delegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // SelectProduct(
                                      //   products: filteredProducts[index],
                                      // ),
                                      Expanded(
                                        child: CustomProductsAllItem(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) => EditProduct(
                                                  product:
                                                      filteredProducts[index],
                                                ),
                                              ),
                                            ).then((value) {
                                              if (value == true) {
                                                widget.viewModel
                                                    .getLimitAllProducts(
                                                  isFirstFetch: true,
                                                );
                                              }
                                            });
                                          },
                                          product: filteredProducts[index],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                childCount: filteredProducts.length,
                              ),
                            ),
                            if (isLoadingMore)
                              const SliverToBoxAdapter(
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(16),
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
              if (showScrollToTopButton)
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: SizedBox(
                    height: 48,
                    width: 48,
                    child: FloatingActionButton(
                      backgroundColor: Colors.blueAccent,
                      onPressed: _scrollToTop,
                      child: const Icon(Icons.arrow_upward),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
