import 'package:dashboard_market/core/resources/color_manager.dart';
import 'package:dashboard_market/features/setting/presentation/pages/setting_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/app_constants.dart';
import '../../../../add_images/presentation/pages/images_view.dart';
import '../../../../add_product/presentation/pages/add_product_view.dart';
import '../../../../categories/presentation/pages/categories_view.dart';
import '../../../../home/presentation/pages/home_view.dart';
import '../../../../products/presentation/page/products_view.dart';
import '../../cubit/layout_cubit.dart';
import 'custom_drawer.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 9,
          child: BlocBuilder<LayoutCubit, LayoutState>(
            builder: (context, state) {
              return Scaffold(
                body: Navigator(
                    key: GlobalKey<NavigatorState>(),
                    onGenerateRoute: (settings) {
                      return MaterialPageRoute(
                        builder: (context) => IndexedStack(
                          index: LayoutCubit.get(context).index,
                          children: viewOptions,
                        ),
                      );
                    }),
              );
            },
          ),
        ),
        Container(
          color: ColorManager.placeHolderColor,
          width: 150,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CustomDrawer(),
          ),
        ),
      ],
    );
  }
}

 const viewOptions = <Widget>[
  HomeView(),
  ProductsScreen(),
  AddProductView(),
  ImagesView()   ,
  CategoriesView(),
   SettingView(),
];