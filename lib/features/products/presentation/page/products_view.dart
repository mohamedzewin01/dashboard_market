import 'package:dashboard_market/core/resources/color_manager.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../products/presentation/cubit/home_cubit.dart';
import '../../../products/presentation/widgets/home_body.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  late ProductsCubit viewModel;

  @override
  void initState() {
    viewModel = getIt.get<ProductsCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel..getHomeData(),
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: ColorManager.orange.withAlpha(10),
          appBar: AppBar(
            backgroundColor: ColorManager.white.withAlpha(100),
            title: Text(
              "سوبر ماركت فضاء الخليج",
              style: getSemiBoldStyle(
                  color: ColorManager.primaryColor, fontSize: 18),
            ),
            centerTitle: true,
            bottom: TabBar(
              isScrollable: false,
              dividerColor: Colors.transparent,
              indicatorColor: ColorManager.primaryColor,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: const EdgeInsets.all(10),
              labelPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              indicatorWeight: 4,
              unselectedLabelColor: Colors.black,
              labelColor: ColorManager.primaryColor,
              labelStyle:
                  getBoldStyle(color: ColorManager.primaryColor, fontSize: 14),
              unselectedLabelStyle:
                  getMediumStyle(color: Colors.black, fontSize: 12),
              tabs: [
                Tab(
                  text: "جميع المنتجات",
                ),
                Tab(
                  text: "المنتجات نشطة",
                ),
                Tab(
                  text: "المنتجات غير نشطة",
                ),
                Tab(
                  text: "العروض",
                ),
                Tab(
                  text: "بدون عروض",
                ),
              ],
            ),
          ),
          body: HomeBody(
            viewModel: viewModel,
          ),
        ),
      ),
    );
  }
}
