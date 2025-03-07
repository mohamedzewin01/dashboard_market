import 'package:dashboard_market/features/home/presentation/pages/home_view.dart';
import 'package:flutter/material.dart';



class AppConstants {
  static const int listGenerate = 6;
  static const viewOptions = <Widget>[
    HomeView(),
    Scaffold(body: Text("اضافة منتجات")),
    Scaffold(body: Text("اضافة صور")),
    Scaffold(body: Text("المنتجات المعروض حاليا")),
    Scaffold(body: Text("الاعدادت")),
  ];
}
