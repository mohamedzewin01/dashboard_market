
import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';

class ItemsDrawer extends StatelessWidget {
  const ItemsDrawer(
      {super.key, required this.title, required this.imagePath, this.onTap,  required this.page});

  final String title;
  final String imagePath;

  final int page;
  final void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: .9,
      child: Card(
        color: ColorManager.white,
        elevation: 10,
        clipBehavior: Clip.antiAlias,
        child: Material(
          color: Colors.transparent, // لتجنب تأثير الـ Card
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(12),
            hoverColor: ColorManager.orange.withAlpha(180),
            splashColor: ColorManager.orange.withAlpha(240),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(imagePath, height: 25, width: 25),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: getSemiBoldStyle(
                          fontSize: 14, color: ColorManager.primaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}