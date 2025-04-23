import 'package:dashboard_market/core/resources/app_constants.dart';
import 'package:dashboard_market/core/resources/color_manager.dart';
import 'package:dashboard_market/core/resources/routes_manager.dart';
import 'package:dashboard_market/core/resources/style_manager.dart';
import 'package:dashboard_market/core/widgets/custom_elevated_button.dart';
import 'package:dashboard_market/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();



  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
            color: ColorManager.primaryColor,
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Center(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Spacer(),
                        Expanded(
                            flex: 1,
                            child: CustomTextFormField(
                              autofocus: true,
                              inputAction: TextInputAction.go,
                              onFieldSubmitted: (value) {
                                if (formKey.currentState!.validate()) {
                                  Navigator.pushReplacementNamed(context, RoutesManager.layout);
                                }
                              },
                              // onFieldSubmitted: (value) =>
                              //     Navigator.pushReplacementNamed(
                              //         context, RoutesManager.layout),
                              controller: passwordController,
                              obscureText: true,
                              maxLines: 1,
                              validator: (value) {
                                if (value!.trim().isEmpty ||
                                    value.trim() == '') {
                                  return 'الحقل فارع';
                                }
                                if (value.trim() != '415263') {
                                  return 'كلمة المرور خاطئة';
                                }
                                return null;
                              },
                              hintText: 'ادخل الرقم السري',
                              labelText: 'الرقم السري',
                            )),
                        Spacer(),
                      ],
                    ),
                    SizedBox(
                      width: 150,
                      child: CustomElevatedButton(
                        buttonColor: ColorManager.primaryColor,
                        title: 'دخول',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.pushReplacementNamed(
                                context, RoutesManager.layout);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100,
            child: Text(AppConstants.version,style: getSemiBoldStyle(color: ColorManager.grey),),
          ),
          Expanded(
              child: Container(
                width: double.infinity,
            color: ColorManager.primaryColor,
                child: Center(child: Text(  'v1.0.0',style: TextStyle(color: ColorManager.placeHolderColor),)),
          )),
        ],
      ),
    );
  }
}
