import 'package:flutter/material.dart';
import '../../features/add_images/presentation/pages/images_view.dart';
import '../../features/home/presentation/pages/home_view.dart';
import '../../features/products/presentation/page/products_view.dart';
import '../../features/setting/presentation/pages/setting_view.dart';


class AppConstants {
  static const int listGenerate = 6;

  static const viewOptions = <Widget>[
    HomeView(),
    ProductsScreen(),
    ImagesView()   ,
    SettingView(),
  ];
}
final GlobalKey<ScaffoldState>  listGenerate = GlobalKey<ScaffoldState>() ;