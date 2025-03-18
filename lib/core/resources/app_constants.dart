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

  static const viewOptionsDesktop = <Widget>[
    HomeView(),
    ProductsView(),
    AddProductView(),
    ImagesView(),
    CategoriesView(),
    SettingView(),
  ];

}
final GlobalKey<ScaffoldState>  listGenerate = GlobalKey<ScaffoldState>() ;