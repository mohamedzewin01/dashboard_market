import 'package:dashboard_market/core/di/di.dart';
import 'package:dashboard_market/core/resources/cashed_image.dart';
import 'package:dashboard_market/core/resources/color_manager.dart';
import 'package:dashboard_market/core/widgets/custom_elevated_button.dart';
import 'package:dashboard_market/features/setting/presentation/manager/store_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api/api_constants.dart';
import '../../../layout/presentation/cubit/layout_cubit.dart';
import '../../data/models/store_info_responce.dart';


class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {

  late StoreInfoCubit viewModel;

  @override
  void initState() {
    viewModel = getIt.get<StoreInfoCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => viewModel..getStoreInfo(),
        child: BlocBuilder<StoreInfoCubit, StoreInfoState>(
          builder: (context, state) {
            if(state is StoreInfoSuccess){
              Store? store = state.storeInfoEntity.store;
              return Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration:  BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('${ApiConstants.baseUrlImage}${store?.storeImage}'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  CustomElevatedButton(
                      buttonColor: ColorManager.orange,
                      title: 'GO',
                      onPressed: () {
                        LayoutCubit.get(context).changeIndex(1);
                      }),
                ],
              );
            }
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('url'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                CustomElevatedButton(
                    buttonColor: ColorManager.orange,
                    title: 'GO',
                    onPressed: () {
                      LayoutCubit.get(context).changeIndex(1);
                    }),
              ],
            );
          },
        ),
      ),
    );
  }
}
