import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/app_constants.dart';
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
                          children: AppConstants.viewOptions,
                        ),
                      );
                    }),
              );
            },
          ),
        ),
        SizedBox(
          width: 200,
          child: CustomDrawer(),
        ),
      ],
    );
  }
}
