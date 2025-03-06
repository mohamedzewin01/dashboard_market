import 'package:flutter/material.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import 'dropDownHomeMenu.dart';

class AppBarBody extends StatelessWidget {
  const AppBarBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 5,
            ),
            SizedBox(
              width: 2,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rabbit',
                  style: TextStyle(
                      color: ColorManager.error,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      letterSpacing: 0),
                ),
              ],
            ),
          ],
        ),
        floating: true,
        snap: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 8, top: 8),
          child: DropDownMenu(),
        ),
        leadingWidth: MediaQuery.of(context).size.width * 2 / 4,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorManager.primaryColor.withAlpha(200),
              ),
              child: CircleAvatar(
                child: Image.asset(
                  Assets.imagesAppIcon,
                  scale: 4,
                ),
              ),
            ),
          )
        ]);
  }
}
