import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/style_manager.dart';
import '../resources/theme_manager.dart';
import '../resources/values_manager.dart';

import 'package:flutter/material.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/style_manager.dart';
import '../resources/theme_manager.dart';
import '../resources/values_manager.dart';

// class CustomTextFormField extends StatelessWidget {
//   const CustomTextFormField({
//     super.key,
//     required this.controller,
//      this.labelText,
//     this.obscureText,
//     this.validator,
//     this.suffix,
//     this.keyboardType,
//     this.enabled,
//     this.prefixIcon,
//     this.initialValue,
//     this.onChanged,
//     this.prefixStyle,
//     this.hintStyle,
//     this.borderSideColor,
//     this.onTap, this.minLines, this.maxLines, this.hintText,
//   });
//
//   final TextEditingController controller;
//   final String? labelText;
//   final String? hintText;
//   final String? initialValue;
//   final bool? obscureText;
//   final bool? enabled;
//   final int? minLines;
//   final int? maxLines;
//   final String? Function(String?)? validator;
//   final Widget? suffix;
//   final Widget? prefixIcon;
//   final TextInputType? keyboardType;
//   final void Function(String)? onChanged;
//   final TextStyle? prefixStyle;
//   final TextStyle? hintStyle;
//   final Color? borderSideColor;
//   final void Function()? onTap;
//
//   // final double borderRadius = AppSize.s5;
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       initialValue: initialValue,
//       readOnly: enabled ?? false,
//       onTap: onTap,
//       // enabled:enabled ,
//             minLines: minLines,
//       maxLines: maxLines,
//       controller: controller,
//       keyboardType: keyboardType,
//       decoration: InputDecoration(
//           prefixIcon: prefixIcon,
//           suffixIcon: suffix != null
//               ? Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               suffix!,
//             ],
//           )
//               : null,
//           prefixStyle: prefixStyle,
//           labelText: labelText,
//           labelStyle: getRegularStyle(
//             color: ColorManager.grey,
//             fontSize: FontSize.s16,
//           ),
//           hintText: hintText,
//           hintStyle: hintStyle ??
//               getRegularStyle(
//                 color: ColorManager.placeHolderColor,
//                 fontSize: FontSize.s14,
//               ),
//           floatingLabelBehavior: FloatingLabelBehavior.always,
//           contentPadding: const EdgeInsets.all(AppPadding.p18),
//           enabledBorder: outLintInputBorderMethod(
//             BorderSide(
//                 color: borderSideColor ?? ColorManager.black,
//                 width: AppSize.w1_5),
//             const BorderRadius.all(Radius.circular(AppSize.s5)),
//           ),
//           focusedBorder: outLintInputBorderMethod(
//             BorderSide(
//                 color: borderSideColor ?? ColorManager.grey,
//                 width: AppSize.w1_5),
//             const BorderRadius.all(Radius.circular(AppSize.s5)),
//           ),
//           errorBorder: outLintInputBorderMethod(
//             BorderSide(
//                 color: borderSideColor ?? ColorManager.error,
//                 width: AppSize.w1_5),
//             const BorderRadius.all(Radius.circular(AppSize.s5)),
//           ),
//           focusedErrorBorder: outLintInputBorderMethod(
//             BorderSide(
//                 color: borderSideColor ?? ColorManager.error,
//                 width: AppSize.w1_5),
//             const BorderRadius.all(Radius.circular(AppSize.s5)),
//           ),
//           disabledBorder: outLintInputBorderMethod(
//             BorderSide(
//                 color: borderSideColor ?? ColorManager.grey,
//                 width: AppSize.w1_5),
//             const BorderRadius.all(Radius.circular(AppSize.s5)),
//           )),
//       obscureText: obscureText ?? false,
//       validator: validator,
//       onChanged: onChanged,
//       // autovalidateMode: AutovalidateMode.onUserInteraction,
//     );
//   }
// }
class CustomTextFormFieldRegister extends StatelessWidget {
  const CustomTextFormFieldRegister({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.obscureText,
    this.validator,
    this.keyboardType,
    this.enabled,
    this.prefixIcon,
    this.initialValue,
    this.onChanged,
    this.onTap,
    this.onChangeRadio,
    this.groupValue,
    this.value,
    this.suffix,
  });

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final bool? obscureText;
  final bool? enabled;
  final String? Function(String?)? validator;

  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final void Function(int?)? onChangeRadio;
  final int? groupValue;
  final int? value;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s45,
      child: TextFormField(
        cursorColor: ColorManager.placeHolderColor,
        style: const TextStyle(color: ColorManager.placeHolderColor),
        initialValue: initialValue,
        readOnly: enabled ?? false,
        onTap: onTap,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          fillColor: ColorManager.placeHolderColor.withAlpha(100),
          filled: true,
          prefixIconColor: ColorManager.white,
          suffixIcon: Radio(
            value: value!,
            groupValue: groupValue,
            fillColor: WidgetStateProperty.all(ColorManager.white),
            onChanged: onChangeRadio,
          ),
          suffixIconColor: ColorManager.placeHolderColor,
          labelText: labelText,
          labelStyle: getRegularStyle(
            color: ColorManager.placeHolderColor,
            fontSize: FontSize.s16,
          ),
          hintText: hintText,
          hintStyle: getSemiBoldStyle(
            color: ColorManager.white,
            fontSize: FontSize.s14,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.all(AppPadding.p18),
          enabledBorder: outLintInputBorderMethod(
            const BorderSide(
                color: ColorManager.placeHolderColor, width: AppSize.w1_5),
            const BorderRadius.all(Radius.circular(AppSize.s20)),
          ),
          focusedBorder: outLintInputBorderMethod(
            const BorderSide(
                color: ColorManager.placeHolderColor, width: AppSize.w1_5),
            const BorderRadius.all(Radius.circular(AppSize.s20)),
          ),
          errorBorder: outLintInputBorderMethod(
            const BorderSide(color: ColorManager.error, width: AppSize.w1_5),
            const BorderRadius.all(Radius.circular(AppSize.s20)),
          ),
          focusedErrorBorder: outLintInputBorderMethod(
            const BorderSide(color: ColorManager.error, width: AppSize.w1_5),
            const BorderRadius.all(Radius.circular(AppSize.s20)),
          ),
          disabledBorder: outLintInputBorderMethod(
            const BorderSide(
                color: ColorManager.placeHolderColor, width: AppSize.w1_5),
            const BorderRadius.all(Radius.circular(AppSize.s20)),
          ),
        ),
        obscureText: obscureText ?? false,
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.obscureText,
    this.validator,
    this.suffix,
    this.keyboardType,
    this.enabled,
    this.prefixIcon,
    this.initialValue,
    this.onChanged,
    this.inputAction, this.minLines, this.maxLines, this.onFieldSubmitted, this.autofocus, this.maxLength, this.focusNode,
  });

  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final bool? obscureText;
  final bool? enabled;
  final bool? autofocus;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? inputAction;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: TextFormField(
        autofocus: autofocus??false,
        maxLength:maxLength ,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        textInputAction: inputAction,
        cursorColor: ColorManager.placeHolderColor,
        style:getSemiBoldStyle(color: ColorManager.black,fontSize: FontSize.s16),
        initialValue: initialValue,
        enabled: enabled ?? true,

        minLines: minLines,
        maxLines: maxLines,
        controller: controller,
        focusNode: FocusNode(),
        keyboardType: keyboardType,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          isDense: true,
          errorStyle: TextStyle(fontSize: 14,),
          prefixIcon: prefixIcon,
          prefixIconColor: ColorManager.placeHolderColor,
          suffixIcon: suffix != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    suffix!,
                  ],
                )
              : null,
          suffixIconColor: ColorManager.placeHolderColor,
          labelText: labelText,
          labelStyle: getRegularStyle(
            color: ColorManager.placeHolderColor,
            fontSize: FontSize.s16,
          ),
          hintText: hintText,
          hintStyle: getRegularStyle(
            color: ColorManager.placeHolderColor2,
            fontSize: FontSize.s14,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.all(AppSize.s8),
          enabledBorder: outLintInputBorderMethod(
            const BorderSide(
                color: ColorManager.placeHolderColor, width: AppSize.w1_5),
            const BorderRadius.all(Radius.circular(AppSize.s12)),
          ),
          focusedBorder: outLintInputBorderMethod(
            const BorderSide(
                color: ColorManager.primaryColor, width: AppSize.w1_5),
            const BorderRadius.all(Radius.circular(AppSize.s12)),
          ),
          errorBorder: outLintInputBorderMethod(
            const BorderSide(
                color: ColorManager.primaryColor, width: AppSize.w1_5),
            const BorderRadius.all(Radius.circular(AppSize.s12)),
          ),
          focusedErrorBorder: outLintInputBorderMethod(
            const BorderSide(
                color: ColorManager.primaryColor, width: AppSize.w1_5),
            const BorderRadius.all(Radius.circular(AppSize.s12)),
          ),
          disabledBorder: outLintInputBorderMethod(
              const BorderSide(
                  color: ColorManager.placeHolderColor, width: AppSize.w1_5),
              const BorderRadius.all(Radius.circular(AppSize.s12))),
        ),
        obscureText: obscureText ?? false,
        validator: validator,
        onChanged: onChanged,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}

class CustomSearchTextFormField extends StatelessWidget {
  const CustomSearchTextFormField({
    super.key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.obscureText,
    this.validator,
    this.suffix,
    this.keyboardType,
    this.enabled,
    this.prefixIcon,
    this.initialValue,
    this.onChanged,
    this.inputAction, this.minLines, this.maxLines,
  });

  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final bool? obscureText;
  final bool? enabled;
  final int? minLines;
  final int? maxLines;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? inputAction;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
      textInputAction: inputAction,
      cursorColor: ColorManager.placeHolderColor,
      style:getSemiBoldStyle(color: ColorManager.black,fontSize: FontSize.s16),
      initialValue: initialValue,
      enabled: enabled ?? true,
      minLines: minLines,
      maxLines: maxLines,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        isDense: true,
        errorStyle: TextStyle(fontSize: 14,),
        prefixIcon: prefixIcon,
        prefixIconColor: ColorManager.placeHolderColor,
        suffixIcon: suffix != null
            ? Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            suffix!,
          ],
        )
            : null,
        suffixIconColor: ColorManager.placeHolderColor,
        labelText: labelText,
        labelStyle: getRegularStyle(
          color: ColorManager.placeHolderColor,
          fontSize: FontSize.s16,
        ),
        hintText: hintText,
        hintStyle: getRegularStyle(
          color: ColorManager.placeHolderColor2,
          fontSize: FontSize.s14,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.all(AppSize.s18),
        enabledBorder: outLintInputBorderMethod(
          const BorderSide(
              color: ColorManager.placeHolderColor, width: AppSize.w1_5),
          const BorderRadius.all(Radius.circular(AppSize.s12)),
        ),
        focusedBorder: outLintInputBorderMethod(
          const BorderSide(
              color: ColorManager.primaryColor, width: AppSize.w1_5),
          const BorderRadius.all(Radius.circular(AppSize.s12)),
        ),
        errorBorder: outLintInputBorderMethod(
          const BorderSide(
              color: ColorManager.primaryColor, width: AppSize.w1_5),
          const BorderRadius.all(Radius.circular(AppSize.s12)),
        ),
        focusedErrorBorder: outLintInputBorderMethod(
          const BorderSide(
              color: ColorManager.primaryColor, width: AppSize.w1_5),
          const BorderRadius.all(Radius.circular(AppSize.s12)),
        ),
        disabledBorder: outLintInputBorderMethod(
            const BorderSide(
                color: ColorManager.placeHolderColor, width: AppSize.w1_5),
            const BorderRadius.all(Radius.circular(AppSize.s12))),
      ),
      obscureText: obscureText ?? false,
      validator: validator,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}