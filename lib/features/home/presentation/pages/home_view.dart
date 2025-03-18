import 'package:dashboard_market/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../products/presentation/cubit/home_cubit.dart';
import '../../../products/presentation/widgets/home_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.primaryColor,
        appBar: AppBar(
          backgroundColor: ColorManager.primaryColor,
          centerTitle: true,
          title: Text(
            "سوبر ماركت فضاء الخليج",
            style: getSemiBoldStyle(color: ColorManager.white, fontSize: 18),
          ),
        ));
  }
}
