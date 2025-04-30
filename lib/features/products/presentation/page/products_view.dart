import 'dart:ui';

import 'package:dashboard_market/core/resources/color_manager.dart';
import 'package:dashboard_market/features/categories/presentation/manager/categories_cubit.dart';
import 'package:dashboard_market/features/products/presentation/cubit/products_cubit.dart';
import 'package:dashboard_market/features/products/presentation/widgets/products_tab_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../../../../core/resources/style_manager.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView>
    with SingleTickerProviderStateMixin {
  late ProductsCubit viewModel;
  late CategoriesCubit categoriesViewModel;

  @override
  void initState() {
    viewModel = getIt.get<ProductsCubit>();
    categoriesViewModel = getIt.get<CategoriesCubit>();
    viewModel.tabController = TabController(length: 5, vsync: this);
    viewModel.tabController.addListener(() {
      if (viewModel.tabController.indexIsChanging) {
        switch (viewModel.tabController.index) {
          case 0:
            viewModel.currentPage = 1;
            viewModel.getLimitAllProducts(); // تحميل كل المنتجات
            break;
          case 1:
            viewModel.currentPage = 1;
            viewModel.getLimitProductsActive(); // تحميل المنتجات المخفضة
            break;
          case 2:
            viewModel.currentPage = 1;
            viewModel.getLimitProductsNotActive(); // تحميل المنتجات غير المخفضة
            break;
          case 3:
            viewModel.currentPage = 1;
            viewModel.getLimitProductsDiscount(); // تحميل المنتجات المخفضة
            break;
          case 4:
            viewModel.currentPage = 1;
            viewModel.getLimitProductsNotDiscount(); // تحميل كل المنتجات
            break;
        }
      }
    });
    viewModel.getLimitAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: viewModel,
        ),
        BlocProvider.value(
          value: categoriesViewModel..getCategoriesData(),
        ),
      ],
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: ColorManager.orange.withAlpha(10),
          appBar: AppBar(
            backgroundColor: ColorManager.white.withAlpha(100),
            title: Text(
              "سوبر ماركت فضاء الخليج",
              style: getSemiBoldStyle(
                  color: ColorManager.primaryColor, fontSize: 18),
            ),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(35),
              child: TabBar(
                controller: viewModel.tabController,
                onTap: (value) {
                  //viewModel.currentPage = 1;///-------------------
                  if (value == 0) viewModel.getLimitAllProducts();
                  if (value == 1) viewModel.getLimitProductsActive();
                  if (value == 2) viewModel.getLimitProductsNotActive();
                  if (value == 3) viewModel.getLimitProductsDiscount();
                  if (value == 4) viewModel.getLimitProductsNotDiscount();
                },
                dividerColor: Colors.transparent,
                indicatorColor: ColorManager.primaryColor,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: const EdgeInsets.all(10),
                labelPadding:
                    const EdgeInsets.symmetric(horizontal: 10),
                indicatorWeight: 4,
                unselectedLabelColor: Colors.black,
                labelColor: ColorManager.primaryColor,
                labelStyle: getBoldStyle(
                    color: ColorManager.primaryColor, fontSize: 14),
                unselectedLabelStyle:
                    getMediumStyle(color: Colors.black),
                tabs: const [
                  Tab(
                    text: "جميع المنتجات",
                  ),
                  Tab(
                    text: "المنتجات نشطة",
                  ),
                  Tab(
                    text: "المنتجات غير نشطة",
                  ),
                  Tab(
                    text: "العروض",
                  ),
                  Tab(
                    text: "بدون عروض",
                  ),
                ],
              ),
            ),
          ),
          body: Listener(
            onPointerDown: (PointerDownEvent event) {
              if (event.kind == PointerDeviceKind.mouse &&
                  event.buttons == kSecondaryMouseButton) {
                final RenderBox overlay =
                Overlay.of(context).context.findRenderObject() as RenderBox;

                showMenu(
                  context: context,
                  position: RelativeRect.fromRect(
                    Rect.fromLTWH(
                      event.position.dx,
                      event.position.dy,
                      0,
                      0,
                    ),
                    Offset.zero & overlay.size,
                  ),
                  color: const Color(0xFFF9F9F9), // لون خلفية فاتح وأنيق
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.grey.shade300),
                  ),
                  elevation: 8,
                  items: [
                    _buildMenuItem(
                      icon: Icons.list_alt,
                      text: 'كل المنتجات',
                      onTap: () {
                        Future.delayed(Duration.zero, () {
                          setState(() {
                            viewModel.tabController.index = 0;
                            viewModel.currentPage = 1;
                            viewModel.getLimitAllProducts();
                          });
                        });
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.check_circle_outline,
                      text: 'المنتجات النشطة',
                      onTap: () {
                        Future.delayed(Duration.zero, () {
                          setState(() {
                            viewModel.tabController.index = 1;
                            viewModel.currentPage = 1;
                            viewModel.getLimitProductsActive();
                          });
                        });
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.remove_circle_outline,
                      text: 'المنتجات الغير نشطة',
                      onTap: () {
                        Future.delayed(Duration.zero, () {
                          setState(() {
                            viewModel.tabController.index = 2;
                            viewModel.currentPage = 1;
                            viewModel.getLimitProductsNotActive();
                          });
                        });
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.local_offer_outlined,
                      text: 'منتجات عليها عرض',
                      onTap: () {
                        Future.delayed(Duration.zero, () {
                          setState(() {
                            viewModel.tabController.index =3;
                            viewModel.currentPage = 1;
                            viewModel.getLimitProductsDiscount();
                          });
                        });
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.block,
                      text: 'منتجات ليس عليها عرض',
                      onTap: () {
                        Future.delayed(Duration.zero, () {
                          setState(() {
                            viewModel.tabController.index = 4;
                            viewModel.currentPage = 1;
                            viewModel.getLimitProductsNotDiscount();
                          });
                        });
                      },
                    ),
                  ],
                );
              }
            },
            child: Expanded(
              child: TabBarView(
                // controller: viewModel.tabController,
                children: [
                  ProductsTabView(
                    viewModel: viewModel,
                  ),
                  // عرض المنتجات لجميع التبويبات
                  ProductsTabView(
                    viewModel: viewModel,
                  ),
                  ProductsTabView(
                    viewModel: viewModel,
                  ),
                  ProductsTabView(
                    viewModel: viewModel,
                  ),
                  ProductsTabView(
                    viewModel: viewModel,
                  ),
                ],
              ),
            ),
          ),

          // HomeBody(
          //   viewModel: viewModel,
          //
          // ),
        ),
      ),
    );
  }
}

PopupMenuItem _buildMenuItem({
  required IconData icon,
  required String text,
  required VoidCallback onTap,
}) {
  return PopupMenuItem(
    onTap: onTap,
    child: Row(
      children: [
        Icon(icon, size: 20, color: ColorManager.orange), // لون أيقونة أنيق
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    ),
  );
}
