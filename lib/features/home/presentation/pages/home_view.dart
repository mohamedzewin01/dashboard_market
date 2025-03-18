import 'package:dashboard_market/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import '../../../../core/resources/style_manager.dart';


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

          title: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              "سوبر ماركت فضاء الخليج",
              style: getSemiBoldStyle(color: ColorManager.white, fontSize: 18),
            ),
          ),
        ));
  }
}
