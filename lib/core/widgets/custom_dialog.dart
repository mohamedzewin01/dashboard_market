
import 'dart:io';

import 'package:dashboard_market/core/widgets/permission_service.dart';
import 'package:flutter/material.dart';


import '../resources/color_manager.dart';
import '../resources/style_manager.dart';
import 'delete_image_dialog.dart';

class CustomDialog {
  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: ColorManager.primary.withAlpha(100),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(
                  color: ColorManager.orange,
                ),
                const SizedBox(height: 20),
                Text(
                  "Loading...",
                  style: getBoldStyle(color: ColorManager.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: ColorManager.primary.withAlpha(200),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: ColorManager.primary.withAlpha(100),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "هل تريد الخروج من البرنامج",
                  textAlign: TextAlign.center,
                  style: getBoldStyle(color: ColorManager.white, fontSize: 18),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // زر NO
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        side: const BorderSide(
                            color: ColorManager.orange, width: 2),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "NO",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),

                    // زر YES
                    ElevatedButton(
                      onPressed: () {
                            Navigator.pop(context);
                            exit(0);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "Yes",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  static void showDeleteDialog(BuildContext context, {void Function()? onPressed}) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: ColorManager.primary.withAlpha(200),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: ColorManager.primary.withAlpha(100),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "هل تريد حذف المنتج نهائياُ",
                  textAlign: TextAlign.center,
                  style: getBoldStyle(color: ColorManager.white, fontSize: 18),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // زر NO
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        side: const BorderSide(
                            color: ColorManager.orange, width: 2),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "NO",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),

                    // زر YES
                    ElevatedButton(
                      onPressed:(){
                        if(onPressed!=null){
                          onPressed();
                          Navigator.pop(context);
                        }

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "Yes",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  static void showSuccessDialog(BuildContext context, {Widget? goto ,String? message,int? duration}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        Future.delayed( Duration(seconds:duration?? 1), () {
          if (context.mounted) {
            Navigator.of(context).pop();
          }
        });

        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: ColorManager.primary.withAlpha(100),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 70,
                ),
                const SizedBox(height: 10),
                Text(
                  message?? "تم اضافة المنتج بنجاح",
                  style: getBoldStyle(color: ColorManager.white, fontSize: 20),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }

  static void showErrorDialog(BuildContext context, {String? message}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: ColorManager.primary.withAlpha(200),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.error_outline,
                  color: ColorManager.error,
                  size: 60,
                ),
                const SizedBox(height: 10),
                const Text(
                  "لقد حدث خطأ!",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  message ?? "Something went wrong. Please try again.",
                  textAlign: TextAlign.center,
                  style: getSemiBoldStyle(color: Colors.white70, fontSize: 18),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text("رجوع",
                        style: getBoldStyle(
                            color: ColorManager.white, fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void showIncompleteDataDialog(BuildContext context,
      {void Function()? onPressed}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: ColorManager.primary.withAlpha(200),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.warning_amber_rounded,
                  color: ColorManager.orange,
                  size: 60,
                ),
                const SizedBox(height: 10),
                const Text(
                  "Incomplete Data!",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Please complete all required fields before proceeding.",
                  textAlign: TextAlign.center,
                  style: getBoldStyle(color: ColorManager.white, fontSize: 18),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text("Complete Data",
                        style: getBoldStyle(
                            color: ColorManager.white, fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  static Future<dynamic> showDialogAddImage(
      BuildContext context, {
        required Function gallery,
        required Function camera,
      }) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(20),
          backgroundColor: ColorManager.primary.withAlpha(250),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            "Choose Image Source",
            textAlign: TextAlign.center,
            style:getBoldStyle(color: ColorManager.white, fontSize: 20),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildOption(
                icon: Icons.photo_library,
                label: "Gallery",
                onTap: () async {
                  final permission = await isPermissionStorageGranted();
                  if (permission == false) return;
                  gallery();
                  if (context.mounted) Navigator.pop(context);
                },
              ),
              _buildOption(
                icon: Icons.camera_alt,
                label: "Camera",
                onTap: () async {
                  final permission = await isPermissionCameraGranted();
                  if (permission == false) return;
                  camera();
                  if (context.mounted) Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
  static Widget _buildOption(
      {required IconData icon, required String label, required Function onTap}) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 40, color: ColorManager.orange),
          const SizedBox(height: 8),
          Text(label, style:getBoldStyle(color: ColorManager.white, fontSize: 16)),
        ],
      ),
    );
  }

  static Future<void> showDoubleConfirmationDialog(BuildContext context, {
    required String imageUrl,
    required VoidCallback onDeleteConfirmed,
  }) async {

    final firstConfirm = await showDialog<bool>(
      context: context,
      builder: (context) => DeleteImageDialog(
        imageUrl: imageUrl,
        onConfirm: () => Navigator.pop(context, true),
      ),
    );

    if (firstConfirm == true) {
      // التحذير الثاني
      final secondConfirm = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('هل أنت متأكد نهائيًا؟'),
          content: const Text(
            'لن تتمكن من استرجاع الصورة بعد الحذف.\nهل تريد المتابعة؟',
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('إلغاء'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('تأكيد الحذف'),
            ),
          ],
        ),
      );

      if (secondConfirm == true) {
        onDeleteConfirmed(); // حذف نهائي
      }
    }
  }

}
