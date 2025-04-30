import 'package:dashboard_market/core/resources/color_manager.dart';
import 'package:dashboard_market/features/products/presentation/cubit/products_cubit.dart';
import 'package:dashboard_market/features/products/presentation/widgets/product_items_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsTabView extends StatelessWidget {
  final ProductsCubit viewModel;

  const ProductsTabView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProductsSuccess) {
          print('55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555   ///////////////////${state.productsEntity?.total}');
          return ProductItemsHome(
            products: state.productsEntity?.products,
            viewModel: viewModel,
            totalProducts: state.productsEntity?.total ?? 0,
          );
        } else if (state is ProductsDiscountSuccess) {
          return ProductItemsHome(
            products: state.productsEntity?.products,
            viewModel: viewModel,
            totalProducts: state.productsEntity?.total ?? 0,
          );
        } else if (state is ProductsNotDiscountSuccess) {
          return ProductItemsHome(
            products: state.productsEntity?.products,
            viewModel: viewModel,
            totalProducts: state.productsEntity?.total ?? 0,
          );
        } else if (state is ProductsActiveSuccess) {
          return ProductItemsHome(
            products: state.productsEntity?.products,
            viewModel: viewModel,
            totalProducts: state.productsEntity?.total ?? 0,
          );
        } else if (state is ProductsNotActiveSuccess) {
          return ProductItemsHome(
            products: state.productsEntity?.products,
            viewModel: viewModel,
            totalProducts: state.productsEntity?.total ?? 0,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorManager.basicColor,
            ),
          );
        }
      },
    );
  }
}
