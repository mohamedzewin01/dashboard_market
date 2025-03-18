import 'package:dashboard_market/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../products/presentation/cubit/home_cubit.dart';
import '../widgets/home_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late ProductsCubit viewModel;

  @override
  void initState() {
    viewModel = getIt.get<ProductsCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel..getHomeData(),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title:  Text("سوبر ماركت فضاء الخليج",style: getSemiBoldStyle(color: ColorManager.primaryColor,fontSize: 18),),
            centerTitle: true,
            bottom: TabBar(
              dividerColor: Colors.transparent,
              indicatorColor: ColorManager.primaryColor,
              // indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 4,
              unselectedLabelColor: Colors.black,
              labelColor: ColorManager.primaryColor,
              labelStyle: getBoldStyle(color: ColorManager.primaryColor,fontSize: 16),
              unselectedLabelStyle: getMediumStyle(color: Colors.black,fontSize: 14),

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
