
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../cubit/layout_cubit.dart';

class ItemsDrawer extends StatelessWidget {
  const ItemsDrawer(
      {super.key, required this.title, required this.svgPath, this.onTap,  required this.page});

  final String title;
  final String svgPath;

  final int page;
  final void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: .9,
      child: Card(
        color:LayoutCubit.get(context).index == page?ColorManager.orange: ColorManager.white,
        elevation: 10,
        clipBehavior: Clip.antiAlias,
        child: Transform.scale(
          scale: .9,
          child: ListTile(
            hoverColor: Colors.orange,
            focusColor: Colors.orange,
            selectedColor: Colors.orange,
            selectedTileColor: Colors.orange,

            mouseCursor: MouseCursor.uncontrolled,
            title: Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  title,
                  textDirection: TextDirection.rtl,
                  style: getSemiBoldStyle(
                      fontSize: 14, color: ColorManager.primaryColor),
                ),
              ),
            ),
            onTap: onTap,
            leading: Image.asset(svgPath,height: 25,width: 25,),
          ),
        ),
      ),
    );
  }
}