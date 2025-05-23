import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_manager.dart';
import 'values_manager.dart';

ThemeData getApplicationTheme() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: ColorManager.primary,
    systemNavigationBarIconBrightness: Brightness.light,
    systemNavigationBarDividerColor: Colors.transparent,
  ));
  return ThemeData(
    // inputDecorationTheme: InputDecorationTheme(
    //   contentPadding: const EdgeInsets.all(AppPadding.p18),
    //   hintStyle: getRegularStyle(
    //       color: ColorManager.placeHolderColor, fontSize: FontSize.s14),
    //   labelStyle:
    //       getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s16),
    //   errorStyle: getRegularStyle(color: ColorManager.error),
    //   enabledBorder: outLintInputBorderMethod(
    //     const BorderSide(color: ColorManager.black, width: AppSize.w1_5),
    //     const BorderRadius.all(Radius.circular(AppSize.s12)),
    //   ),
    //   focusedBorder: outLintInputBorderMethod(
    //     const BorderSide(color: ColorManager.grey, width: AppSize.w1_5),
    //     const BorderRadius.all(Radius.circular(AppSize.s12)),
    //   ),
    //   errorBorder: outLintInputBorderMethod(
    //     const BorderSide(color: ColorManager.error, width: AppSize.w1_5),
    //     const BorderRadius.all(Radius.circular(AppSize.s12)),
    //   ),
    //   focusedErrorBorder: outLintInputBorderMethod(
    //     const BorderSide(color: ColorManager.black, width: AppSize.w1_5),
    //     const BorderRadius.all(Radius.circular(AppSize.s12)),
    //   ),
    // ),
  );
}
AppBarTheme appBarTheme() {
  return  AppBarTheme(
    color: ColorManager.cardColor.withAlpha(200),
    elevation: AppSize.s5,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
}
OutlineInputBorder outLintInputBorderMethod(
    BorderSide borderSide, BorderRadius borderRadius) {
  return OutlineInputBorder(
    borderSide: borderSide,
    borderRadius: const BorderRadius.all(Radius.circular(AppSize.s12)),
  );
}
