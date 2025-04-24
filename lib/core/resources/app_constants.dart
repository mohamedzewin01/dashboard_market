

import 'package:dashboard_market/features/banners/presentation/page/banners_view.dart';
import 'package:flutter/material.dart';
import '../../features/add_images/presentation/pages/images_view.dart';
import '../../features/add_product/presentation/pages/add_product_view.dart';
import '../../features/categories/presentation/pages/categories_view.dart';
import '../../features/home/presentation/pages/home_view.dart';
import '../../features/products/presentation/page/products_view.dart';
import '../../features/setting/presentation/pages/setting_view.dart';


class AppConstants {
  static const int listGenerate = 6;

  static const viewOptions = <Widget>[
    HomeView(),
    ProductsView(),
    ImagesView()   ,
    SettingView(),
  ];

  static  List<Widget> viewOptionsDesktop = <Widget>[
    HomeView(),
    ProductsView(),
    AddProductView(),
    ImagesView(),
    CategoriesView(),
    BannersView(),
    SettingView(),

  ];
 static final List<Color> colors = [
    Colors.orange,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.purple,
    Colors.teal,
    Colors.pink,
    Colors.cyan,
    Colors.indigo,
    Colors.lime,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.lightGreen,
    Colors.lightBlue,
    Colors.brown,
    Colors.grey,
  ];

  static final List<String> actionString = [
    '💥', // انفجار - يعبر عن الحماس
    '🎉', // احتفال - يعبر عن السعادة
    '🎁', // هدية - يعبر عن المكافآت
    '💯', // مئة بالمئة - يعبر عن الجودة
    '✨', // بريق - يعبر عن التميز
    '🔥', // نار - يعبر عن العروض الساخنة
    '🚀', // صاروخ - يعبر عن السرعة
    '🌟', // نجمة - يعبر عن التفوق
    '🛍️', // حقيبة تسوق - يعبر عن الشراء
    '📣', // مكبر صوت - يعبر عن الإعلان
    '⚡', // صاعقة - يعبر عن العروض القوية
    '🔔', // جرس - يعبر عن التنبيه بالعروض
    '🏷️', // بطاقة خصم - يعبر عن التخفيضات
    '🌟', // نجمة - يعبر عن التفوق];
  ];

  // مولد عشوائي

static String version= 'v 1.0.4';

}


final GlobalKey<ScaffoldState>  listGenerate = GlobalKey<ScaffoldState>() ;
 int idCategory = 0;