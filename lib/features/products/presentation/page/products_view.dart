import 'dart:developer';

import 'package:dashboard_market/features/products/presentation/widgets/edit_product.dart';
import 'package:dashboard_market/features/products/presentation/widgets/products_all_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../../core/resources/color_manager.dart';
import '../../data/models/response/AllProductsRespose.dart';
import '../cubit/home_cubit.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late HomeCubit viewModel;

  @override
  void initState() {
    viewModel = getIt.get<HomeCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return viewModel.getHomeData();
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorManager.white,
          body: BlocProvider(
            create: (context) => viewModel..getHomeData(),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {}
                if (state is HomeSuccess) {
                  List<Products>? products =
                      state.homeEntity?.products?.reversed.toList() ?? [];
                  return RefreshIndicator(
                    color: ColorManager.primaryColor,
                    onRefresh: () => viewModel.getHomeData(),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          int crossAxisCount = constraints.maxWidth > 900
                              ? 5
                              : constraints.maxWidth > 700
                                  ? 3
                                  : 2;
                          log(constraints.maxWidth.toString());
                          return CustomScrollView(
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
                                  (context, index) => CustomProductsAllItem(
                                    viewModel: viewModel,
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,

                                        builder: (context) => EditProduct(
                                          viewModel: viewModel,
                                          product: products[index],
                                        ),
                                      );
                                    },
                                    product: products[index],
                                  ),
                                  childCount: products.length,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  );

                }
                return SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}
