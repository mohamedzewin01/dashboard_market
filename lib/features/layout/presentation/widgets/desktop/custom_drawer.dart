import 'package:dashboard_market/core/resources/style_manager.dart';
import 'package:dashboard_market/features/layout/presentation/cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/widgets/custom_dialog.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<ItemsDrawer> drawerItems = [
      ItemsDrawer(
        title: 'الرئيسية',
        svgPath: Assets.master,
        onTap: () => LayoutCubit.get(context).changeIndex(0),
      ),
      ItemsDrawer(
        title: 'المنتجات',
        svgPath: Assets.products,
        onTap: () => LayoutCubit.get(context).changeIndex(1),
      ),
      ItemsDrawer(
        title: 'اضافة منتج',
        svgPath: Assets.uploadImage,
        onTap: () => LayoutCubit.get(context).changeIndex(2),
      ),
      ItemsDrawer(
        title: 'الصور',
        svgPath: Assets.uploadImage,
        onTap: () => LayoutCubit.get(context).changeIndex(3),
      ),
      ItemsDrawer(
        title: 'الاقسام',
        svgPath: Assets.uploadImage,
        onTap: () => LayoutCubit.get(context).changeIndex(4),
      ),
      ItemsDrawer(
        title: 'الاعدادات',
        svgPath: Assets.setting,
        onTap: () => LayoutCubit.get(context).changeIndex(5),
      ),
    ];
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 24,vertical: 8),
              clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(

                  shape:BoxShape.circle
                ),
                child: Image.asset('assets/images/zewin.jpg', fit: BoxFit.cover,)),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Text(
                'فضاء الخليج',
                style: getSemiBoldStyle(color: ColorManager.white),
              ),
            ),
          ),
          SliverToBoxAdapter(
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
                Spacer(),
                ItemsDrawer(title: 'خروج', svgPath: '',onTap: () => CustomDialog.showExitDialog(context),),
                SizedBox(height: 8,),
                Text('محمد زوين \n0558568986',style: getSemiBoldStyle(color: ColorManager.primaryColor),)
                ,SizedBox(height: 8,)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ItemsDrawer extends StatelessWidget {
  const ItemsDrawer(
      {super.key, required this.title, required this.svgPath, this.onTap});

  final String title;
  final String svgPath;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {

    return Transform.scale(
      scale: .9,
      child: Card(
        color: ColorManager.white,
        elevation: 10,
        clipBehavior: Clip.antiAlias,

        child: Transform.scale(
          scale: .9,
          child: ListTile(
            hoverColor: Colors.orange,
            mouseCursor: MouseCursor.uncontrolled,
            title: Center(
              child: Text(
                title,
                textDirection: TextDirection.rtl,
                style: getSemiBoldStyle(
                    fontSize: 14,  color: ColorManager.primaryColor),
              ),
            ),
            onTap: onTap,
            leading: SvgPicture.asset(
              svgPath,
              colorFilter: ColorFilter.mode(ColorManager.black, BlendMode.srcIn),
            ),
          ),
        ),
      ),
    );
  }
}
