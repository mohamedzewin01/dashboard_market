import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../../../../core/resources/color_manager.dart';
import '../../data/models/response/HomeModelResponseDto.dart';
import '../cubit/home_cubit.dart';
import '../widgets/app_bar_body.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeCubit viewModel;

  @override
  void initState() {
    viewModel = getIt<HomeCubit>();
    super.initState();
  }

  @override
  void dispose() {
    viewModel.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => viewModel..getHomeData(),
        child: Scaffold(
          body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [AppBarBody()];
          }, body: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeSuccess) {
                return RefreshIndicator(
                  color: ColorManager.primaryColor,
                  onRefresh: () => viewModel.getHomeData(),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [

                        ],
                    ),
                  ));




              }
              if (state is HomeLoading) {

              }
              if (state is HomeFail) {}
              return Text('error');
            },
          )),
        ));
  }
}
