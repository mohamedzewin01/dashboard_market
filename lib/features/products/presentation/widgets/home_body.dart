import 'package:dashboard_market/features/products/presentation/cubit/products_cubit.dart';
import 'package:dashboard_market/features/products/presentation/widgets/product_items_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/color_manager.dart';
import 'package:dashboard_market/features/products/data/models/response/AllProductsResponse.dart';


class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.viewModel,
  });

  final ProductsCubit viewModel;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primaryColor,
                ),
              );
            }
            if (state is ProductsSuccess) {
              List<Products>? products =
                  state.productsEntity?.products ?? [];
              return RefreshIndicator(
                color: ColorManager.primaryColor,
                onRefresh: () => viewModel.getLimitAllProducts(),
                child:
                    ProductItemsHome(viewModel: viewModel, products: products),
              );
            }
            return SizedBox();
          },
        ),
        BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primaryColor,
                ),
              );
            }
            if (state is ProductsSuccess) {
              List<Products>? products =
                  state.productsEntity?.products ?? [];
              List<Products>? products2 = [];
              products2 =
                  products.where((element) => element.status == 1).toList();
              return RefreshIndicator(
                color: ColorManager.primaryColor,
                onRefresh: () => viewModel.getLimitAllProducts(),
                child:
                    ProductItemsHome(viewModel: viewModel, products: products2),
              );
            }

            return Center(
                child: CircularProgressIndicator(
              color: ColorManager.primaryColor,
            ));
          },
        ),
        BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primaryColor,
                ),
              );
            }
            if (state is ProductsSuccess) {
              List<Products>? products =
                  state.productsEntity?.products?? [];
              List<Products>? products3 = [];
              products3 =
                  products.where((element) => element.status == 0).toList();
              return RefreshIndicator(
                color: ColorManager.primaryColor,
                onRefresh: () => viewModel.getLimitAllProducts(),
                child:
                    ProductItemsHome(viewModel: viewModel, products: products3),
              );
            }
            return Center(
                child: CircularProgressIndicator(
              color: ColorManager.primaryColor,
            ));
          },
        ),
        BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primaryColor,
                ),
              );
            }
            if (state is ProductsDiscountSuccess) {
              List<Products>? products =
                  state.productsEntity?.products?? [];
              List<Products>? products3 = [];
              products3 =
                  products.where((element) => element.descount != 0).toList();
              return RefreshIndicator(
                color: ColorManager.primaryColor,
                onRefresh: () => viewModel.getLimitAllProducts(),
                child:
                ProductItemsHome(viewModel: viewModel, products: products3),
              );
            }
            return Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primaryColor,
                ));
          },
        ),
        BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primaryColor,
                ),
              );
            }
            if (state is ProductsSuccess) {
              List<Products>? products =
                  state.productsEntity?.products ?? [];
              List<Products>? products3 = [];
              products3 =
                  products.where((element) => element.descount == 0).toList();
              return RefreshIndicator(
                color: ColorManager.primaryColor,
                onRefresh: () => viewModel.getLimitAllProducts(),
                child:
                ProductItemsHome(viewModel: viewModel, products: products3),
              );
            }
            return Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primaryColor,
                ));
          },
        ),
      ],
    );
  }
}
