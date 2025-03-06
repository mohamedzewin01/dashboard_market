import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'style_manager.dart';
import 'values_manager.dart';

ThemeData getApplicationTheme() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: ColorManager.primary,
    systemNavigationBarIconBrightness: Brightness.light,
    systemNavigationBarDividerColor: Colors.transparent,
  ));
  return ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(
          color: ColorManager.placeHolderColor, fontSize: FontSize.s14),
      labelStyle:
          getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s16),
      errorStyle: getRegularStyle(color: ColorManager.error),
      enabledBorder: outLintInputBorderMethod(
        const BorderSide(color: ColorManager.black, width: AppSize.w1_5),
        const BorderRadius.all(Radius.circular(AppSize.s40)),
      ),
      focusedBorder: outLintInputBorderMethod(
        const BorderSide(color: ColorManager.grey, width: AppSize.w1_5),
        const BorderRadius.all(Radius.circular(AppSize.s40)),
      ),
      errorBorder: outLintInputBorderMethod(
        const BorderSide(color: ColorManager.error, width: AppSize.w1_5),
        const BorderRadius.all(Radius.circular(AppSize.s40)),
      ),
      focusedErrorBorder: outLintInputBorderMethod(
        const BorderSide(color: ColorManager.black, width: AppSize.w1_5),
        const BorderRadius.all(Radius.circular(AppSize.s40)),
      ),
    ),
  );
}

OutlineInputBorder outLintInputBorderMethod(
    BorderSide borderSide, BorderRadius borderRadius) {
  return OutlineInputBorder(
    borderSide: borderSide,
    borderRadius: const BorderRadius.all(Radius.circular(AppSize.s20)),
  );
}
