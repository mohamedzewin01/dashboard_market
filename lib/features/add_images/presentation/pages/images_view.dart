import 'dart:developer';
import 'package:dashboard_market/core/di/di.dart';
import 'package:dashboard_market/core/resources/color_manager.dart';
import 'package:dashboard_market/core/widgets/custom_text_form_field.dart';
import 'package:dashboard_market/features/add_images/presentation/manager/images_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../data/models/images_model.dart';
import '../widgets/upLoad_image.dart';
import '../widgets/custom_item_image.dart';
import '../widgets/section_list_images.dart';
import '../widgets/section_upload_images.dart';

class ImagesView extends StatefulWidget {
  const ImagesView({super.key});

  @override
  State<ImagesView> createState() => _ImagesViewState();
}

class _ImagesViewState extends State<ImagesView> {
  late ImagesCubit viewModel;

  @override
  void initState() {
    viewModel = getIt.get<ImagesCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel..fetchImages(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: LayoutBuilder(builder: (context, constraints) {
              int crossAxisCount = constraints.maxWidth > 900
                  ? 6
                  : constraints.maxWidth > 700
                      ? 4
                      : 3;
              return BlocBuilder<ImagesCubit, ImagesState>(
                builder: (context, state) {
                  if (state is SuccessImages) {
                    var listImage =
                        state.imagesEntity.images?.reversed.toList();
                    
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          SectionUploadImages(viewModel: viewModel),
                          Divider(),
                          SectionListImages(
                              crossAxisCount: crossAxisCount,
                              listImage: listImage ?? [],
                              viewModel: viewModel)
                        ],
                      ),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}


