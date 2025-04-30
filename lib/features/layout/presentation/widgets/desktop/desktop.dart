import 'package:dashboard_market/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/app_constants.dart';
import '../../cubit/layout_cubit.dart';
import 'custom_drawer.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = LayoutCubit.get(context);
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
    return Scaffold(
        backgroundColor: ColorManager.white.withAlpha(240),
        body: Card(
          elevation: 6,
          clipBehavior: Clip.antiAlias,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8.0, vertical: 4),
                child: Card(
                  elevation: 6,
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    width: MediaQuery
                        .sizeOf(context)
                        .width * .14,
                    constraints: const BoxConstraints(minWidth: 200),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        ColorManager.white,
                        ColorManager.offwhite.withAlpha(50),
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: CustomDrawer(),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: BlocBuilder<LayoutCubit, LayoutState>(
                  builder: (context, state) {
                    return Navigator(
                        key: navigatorKey,
                        onGenerateRoute: (settings) {
                          return MaterialPageRoute(
                            builder: (context) =>
                            AppConstants.viewOptionsDesktop[cubit.index],
                            // IndexedStack(
                            //   index: LayoutCubit.get(context).index,
                            //   children: AppConstants.viewOptionsDesktop,
                            // ),

                          );
                        });
                  },
                ),
              ),
            ],
          ),
        )
    );
  }
}


