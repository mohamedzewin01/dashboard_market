
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dashboard_market/core/di/di.dart';
import 'package:dashboard_market/core/resources/color_manager.dart';
import 'package:dashboard_market/features/setting/presentation/manager/store_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';


import '../../../../core/api/api_constants.dart';
import '../../../layout/presentation/cubit/layout_cubit.dart';
import '../../data/models/store_info_responce.dart';
import '../widgets/store_info_body.dart';

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
    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          LayoutCubit.get(context).changeIndex(0);
        } else if (constraints.maxWidth > 600) {
          return BlocProvider(
            create: (context) => viewModel..getStoreInfo(),
            child: BlocBuilder<StoreInfoCubit, StoreInfoState>(
              builder: (context, state) {
                if (state is StoreInfoSuccess) {
                  final Store? store = state.storeInfoEntity.store;
                  viewModel.storeNameController.text = store?.storeName ?? '';
                  viewModel.discreptionController.text =
                      store?.storeDescreption ?? '';
                  viewModel.storeDiscountTitleController.text =
                      store?.storeDiscountTitle ?? '';
                  viewModel.imageName = store?.storeImage ?? '';

                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            viewModel.imagePath.isNotEmpty
                                ? Container(
                                    width: double.infinity,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            FileImage(File(viewModel.imagePath)),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  )
                                : Container(
                                    width: double.infinity,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                            '${ApiConstants.baseUrlImage}${store?.storeImage}'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              child: GestureDetector(
                                onTap: () async {
                                  final XFile? xFile = await ImagePicker()
                                      .pickImage(source: ImageSource.gallery);
                                  if (xFile != null) {
                                    setState(() {
                                      viewModel.imageFile = File(xFile.path);
                                      viewModel.imagePath = xFile.path;
                                      viewModel.uploadImageStore();
                                    });
                                  }
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    backgroundColor: ColorManager.orange,
                                    child: Icon(Icons.change_circle_outlined),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            if (constraints.maxWidth < 600) {
                              return StoreInfoBody(
                                viewModel: viewModel,
                              );
                            }
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  const Spacer(),
                                  Expanded(
                                      flex: 2,
                                      child: StoreInfoBody(
                                        viewModel: viewModel,
                                      )),
                                  const Spacer(),
                                ],
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  );
                }
                return const Center(
                    child: CircularProgressIndicator(
                        color: ColorManager.primaryColor));
              },
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    ));
  }
}
