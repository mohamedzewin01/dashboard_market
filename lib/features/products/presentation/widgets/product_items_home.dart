import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_text_form_field.dart';
import '../../data/models/response/AllProductsRespose.dart';
import '../cubit/home_cubit.dart';
import 'edit_product.dart';
import 'products_all_items.dart';
import 'search_bar.dart';

class ProductItemsHome extends StatefulWidget {
  const ProductItemsHome({
    super.key,
    required this.viewModel,
    required this.products,
  });

  final ProductsCubit viewModel;
  final List<Products>? products;

  @override
  State<ProductItemsHome> createState() => _ProductItemsHomeState();
}

class _ProductItemsHomeState extends State<ProductItemsHome> {
  List<Products>? filteredProducts = [];
  String query = "";

  @override
  void initState() {
    super.initState();
    filteredProducts = widget.products;
  }

  void updateSearch(String searchQuery) {
    setState(() {
      query = searchQuery;
      filteredProducts = widget.products
          ?.where((product) => product.productName!
              .toLowerCase()
              .contains(searchQuery.toLowerCase()))
          .toList();
    });
  }

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = constraints.maxWidth > 900
              ? 5
              : constraints.maxWidth > 700
                  ? 3
                  : 2;
          log(constraints.maxWidth.toString());
          return Column(
            children: [
              Row(
                children: [
                  crossAxisCount > 2 ? Spacer():SizedBox(width: 16,),
                  Expanded(
                    flex: 2,
                    child: CustomSearchTextFormField(
                      hintText: 'ابحث عن المنتجات ...',
                      prefixIcon: Icon(Icons.search),
                      controller: searchController,
                      onChanged: (value) {
                        updateSearch(value);
                      },
                    ),
                  ),
                  crossAxisCount > 2 ? Spacer():SizedBox(width: 16,),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                        childAspectRatio: 1.0,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => CustomProductsAllItem(
                          viewModel: widget.viewModel,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProduct(
                                  viewModel: widget.viewModel,
                                  product: filteredProducts![index],
                                ),
                              ),
                            );
                          },
                          product: filteredProducts![index],
                        ),
                        childCount: filteredProducts?.length,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
