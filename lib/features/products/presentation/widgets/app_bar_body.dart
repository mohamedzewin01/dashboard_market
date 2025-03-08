import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';

class AppBarBody extends StatelessWidget {
  const AppBarBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 5,
          ),
          SizedBox(
            width: 2,
          ),
          Text(
            'تموينات فضاء الخليج',
            style: TextStyle(
                color: ColorManager.error,
                fontWeight: FontWeight.w700,
                fontSize: 18,
                letterSpacing: 0),
          ),
        ],
      ),
      floating: true,
    );
  }
}
