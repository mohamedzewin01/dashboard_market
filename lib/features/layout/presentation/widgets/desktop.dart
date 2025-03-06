import 'package:flutter/material.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import 'mobile.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Scaffold(
              backgroundColor: ColorManager.primaryColor,
              body: Center(
                child: Image.asset(
                  Assets.imagesAppIcon,
                  scale: 2.5,
                ),
              ),
            )),
        Expanded(flex: 5, child: LayoutMobileView()),
        Expanded(
            flex: 1,
            child: Scaffold(
              backgroundColor: ColorManager.primaryColor,
              body: Center(
                child: Image.asset(
                  Assets.imagesAppIcon,
                  scale: 2.5,
                ),
              ),
            )),
      ],
    );
  }
}
