


import 'package:dashboard_market/core/resources/color_manager.dart';
import 'package:dashboard_market/core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import '../../../layout/presentation/cubit/layout_cubit.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomElevatedButton(buttonColor: ColorManager.orange, title: 'GO', onPressed: (){
             LayoutCubit.get(context).changeIndex(1);

          }),
        ],
      ),
    );
  }
}
