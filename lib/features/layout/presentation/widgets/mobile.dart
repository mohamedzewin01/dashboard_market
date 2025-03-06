import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/app_constants.dart';
import '../cubit/layout_cubit.dart';
import 'custom_button_navigation_bar.dart';

class LayoutMobileView extends StatelessWidget {
  const LayoutMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return Scaffold(
          body: AppConstants.viewOptions[cubit.index],
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
