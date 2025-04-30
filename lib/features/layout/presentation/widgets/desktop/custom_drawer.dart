import 'package:dashboard_market/core/resources/app_constants.dart';
import 'package:dashboard_market/core/resources/style_manager.dart';
import 'package:dashboard_market/features/layout/presentation/cubit/layout_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../Items_drawer.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<ItemsDrawer> drawerItems = [
      ItemsDrawer(
        title: 'الرئيسية',
        imagePath: Assets.home,
        page: 0,
        onTap: () => LayoutCubit.get(context).changeIndex(0),
      ),
      ItemsDrawer(
        title: 'المنتجات',
        imagePath: Assets.productsTap,
        page: 1,
        onTap: () => LayoutCubit.get(context).changeIndex(1),
      ),
      ItemsDrawer(
        title: 'اضافة منتج',
        imagePath: Assets.addProduct,
        page: 2,
        onTap: () => LayoutCubit.get(context).changeIndex(2),
      ),
      ItemsDrawer(
        title: 'الصور',
        imagePath: Assets.uploadImages,
        page: 3,
        onTap: () => LayoutCubit.get(context).changeIndex(3),
      ),
      ItemsDrawer(
        title: 'الاقسام',
        imagePath: Assets.categories,
        page: 4,
        onTap: () => LayoutCubit.get(context).changeIndex(4),
      ),
      ItemsDrawer(
        title: ' البانرات',
        imagePath: Assets.banners,
        page: 6,
        onTap: () => LayoutCubit.get(context).changeIndex(5),
      ),
      ItemsDrawer(
        title: 'الاعدادات',
        imagePath: Assets.settingTap,
        page: 5,
        onTap: () => LayoutCubit.get(context).changeIndex(6),
      ),

    ];
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [
                  ColorManager.white,
                  ColorManager.offwhite,

                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.cover,
              )),
        ),
        SliverToBoxAdapter(
          child: Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'سوبر ماركت فضاء الخليج',
                  style: getSemiBoldStyle(
                      color: ColorManager.orange, fontSize: 24),
                ),
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 24,
          ),
        ),
        SliverList.builder(
            itemBuilder: (context, index) => drawerItems[index],
            itemCount: drawerItems.length),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const Spacer(),
              ItemsDrawer(
                page: 6,
                title: 'خروج',
                imagePath: Assets.exit,
                onTap: () => CustomDialog.showExitDialog(context),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'محمد زوين \n0558568986',
                style: getSemiBoldStyle(color: ColorManager.primaryColor),
              ),
              Text(
                AppConstants.version,
                style: getSemiBoldStyle(color: ColorManager.primaryColor),
              ),
              const SizedBox(
                height: 8,
              )
            ],
          ),
        )
      ],
    );
  }
}
