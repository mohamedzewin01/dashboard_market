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

}


final GlobalKey<ScaffoldState>  listGenerate = GlobalKey<ScaffoldState>() ;