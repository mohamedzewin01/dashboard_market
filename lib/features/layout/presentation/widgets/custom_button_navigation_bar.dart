import 'package:flutter/material.dart';

//import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import '../../../../core/functions/helper.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../l10n/app_localizations.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });

  final int currentIndex;
  final Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: ColorManager.white,
      items: [
        BottomNavigationBarItem(
          icon: buildIcon(Icons.home, 0, currentIndex),
          label: AppLocalizations.of(context)!.home,
        ),
        BottomNavigationBarItem(
          icon: buildIcon(Icons.category_sharp, 1, currentIndex),
          label: AppLocalizations.of(context)!.categories,
        ),
        BottomNavigationBarItem(
          icon: buildIcon(Icons.image, 2, currentIndex),
          label: AppLocalizations.of(context)!.cart,
        ),
        BottomNavigationBarItem(
          icon: buildIcon(Icons.settings, 3, currentIndex),
          label: AppLocalizations.of(context)!.profile,
        ),
      ],
      selectedFontSize: AppSize.s12,
      selectedLabelStyle: getLightStyle(color: ColorManager.orange),
      unselectedLabelStyle: getMediumStyle(color: ColorManager.orange),
      currentIndex: currentIndex,
      onTap: onItemTapped,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorManager.black,
    );
  }
}
