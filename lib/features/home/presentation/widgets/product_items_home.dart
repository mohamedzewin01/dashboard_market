
import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../products/data/models/response/AllProductsRespose.dart';
import '../../../products/presentation/cubit/home_cubit.dart';
import '../../../products/presentation/widgets/edit_product.dart';
import '../../../products/presentation/widgets/products_all_items.dart';
import '../../../products/presentation/widgets/search_bar.dart';

class ProductItemsHome extends StatelessWidget {
  const ProductItemsHome({
    super.key,
    required this.viewModel,
    required this.products,
  });

  final ProductsCubit viewModel;
  final List<Products>? products;

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
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: CustomScrollView(
                  slivers: [
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
                              viewModel: viewModel,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EditProduct(
                                          viewModel: viewModel,
                                          product: products![index],
                                        ),
                                  ),
                                );
                              },
                              product: products![index],
                            ),
                        childCount: products?.length,
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