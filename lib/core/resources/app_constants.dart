import 'package:flutter/material.dart';

import '../../features/home/presentation/pages/home_view.dart';
import '../../features/products/presentation/products_view.dart';

class AppConstants {
  static const int listGenerate = 6;
  static const viewOptions = <Widget>[
    HomeView(),
    ProductsScreen(),
    Scaffold(body: Text("اضافة صور")),
    Scaffold(body: Text("المنتجات المعروض حاليا")),
    Scaffold(body: Text("الاعدادت")),
  ];
}
