import '../resources/color_manager.dart';
import '../resources/style_manager.dart';
import 'package:flutter/material.dart';

class AddImage {
  static Future<dynamic> showCupertinoModalPopupAddImage(BuildContext context,
      {required Function gallery, }) async {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: InkWell(
                  onTap: () async {
                    gallery();
                    Navigator.pop(context);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.photo_library,
                          size: 30, color: ColorManager.primaryColor),
                      const SizedBox(height: 5),
                      Text('عرض الصور',
                          style: getBoldStyle(color: ColorManager.grey)),
                    ],
                  ),
                ),
              ),
              Container(
                width: 1,
                height: 50,
                color: ColorManager.primaryColor.withAlpha(150),
              ),

            ],
          ),
        );
      },
    );
  }
}
