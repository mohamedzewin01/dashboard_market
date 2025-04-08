import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_text_form_field.dart';
import '../manager/store_info_cubit.dart';

class StoreInfoBody extends StatelessWidget {
  const StoreInfoBody({
    super.key,
    required this.viewModel,
  });

  final StoreInfoCubit viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        CustomTextFormField(
          controller: viewModel.storeNameController,
          onChanged: (value) {
            viewModel.editStoreInfo();
          },
        ),
        CustomTextFormField(
            controller: viewModel.storeDiscountTitleController,
            onChanged: (value) {
              viewModel.editStoreInfo();
            }),
        CustomTextFormField(
            controller: viewModel.discreptionController,
            onChanged: (value) {
              viewModel.editStoreInfo();
            }),
      ],
    );
  }
}
