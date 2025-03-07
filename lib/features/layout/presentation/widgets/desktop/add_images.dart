import 'package:dashboard_market/features/layout/presentation/cubit/layout_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/color_manager.dart';

class ShowAllImages extends StatelessWidget {
  const ShowAllImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: Column(
        children: [
          Text(LayoutCubit.get(context).number.toString()),
        ],
      ),
    );
  }
}
