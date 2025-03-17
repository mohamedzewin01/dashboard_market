

import 'package:dashboard_market/features/home/presentation/widgets/product_items_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../products/data/models/response/AllProductsRespose.dart';
import '../../../products/presentation/cubit/home_cubit.dart';


class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key, required this.viewModel,
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
                  state.homeEntity?.products?.reversed.toList() ?? [];
              return RefreshIndicator(
                color: ColorManager.primaryColor,
                onRefresh: () => viewModel.getHomeData(),
                child: ProductItemsHome(viewModel: viewModel, products: products),
              );
            }
            return SizedBox();
          },
        ),
        BlocProvider(
          create: (context) => viewModel..getHomeData(),
          child: BlocBuilder<ProductsCubit, ProductsState>(
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
                    state.homeEntity?.products?.reversed.toList() ?? [];
                List<Products>? products2 =[];
                products2 = products.where((element) => element.status == 1).toList();
                return RefreshIndicator(
                  color: ColorManager.primaryColor,
                  onRefresh: () => viewModel.getHomeData(),
                  child: ProductItemsHome(viewModel: viewModel, products: products2),
                );
              }
              return SizedBox();
            },
          ),
        ),
        BlocProvider(
          create: (context) => viewModel..getHomeData(),
          child: BlocBuilder<ProductsCubit, ProductsState>(
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
                    state.homeEntity?.products?.reversed.toList() ?? [];
                List<Products>? products3 =[];
                products3 = products.where((element) => element.status == 0).toList();
                return RefreshIndicator(
                  color: ColorManager.primaryColor,
                  onRefresh: () => viewModel.getHomeData(),
                  child: ProductItemsHome(viewModel: viewModel, products: products3),
                );
              }
              return SizedBox();
            },
          ),
        )


      ],
    );
  }
}



