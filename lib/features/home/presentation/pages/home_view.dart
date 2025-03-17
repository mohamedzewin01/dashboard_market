import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
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
            title: const Text("Home"),
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: "جميع المنتجات",
                ),
                Tab(
                  text: "المنتجات المنشورة حاليا",
                ),
                Tab(
                  text: "المنتجات الغير منشورة",
                ),
              ],
            ),
          ),
          body: HomeBody(viewModel: viewModel,),
        ),
      ),
    );
  }
}

