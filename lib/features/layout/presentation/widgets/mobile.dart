import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/app_constants.dart';

import '../cubit/layout_cubit.dart';

import 'custom_button_navigation_bar.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = LayoutCubit.get(context);

    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [

              Navigator(
                key: GlobalKey<NavigatorState>(),
                onGenerateRoute: (settings) {
                  return MaterialPageRoute(
                    builder: (context) => AppConstants.viewOptions[cubit.index],
                  );
                },
              ),
            ],
          ),
          bottomNavigationBar: CustomBottomNavigationBar(
            currentIndex: cubit.index,
            onItemTapped: (index) {
              cubit.changeIndex(index);
            },
          ),
        );
      },
    );
  }
}
