
import 'package:dashboard_market/features/add_product/presentation/manager/ProductPhoto/product_photo_cubit.dart';
import 'package:flutter/material.dart';
import 'add_image_product.dart';

Future<bool> showImagePickerBottomSheet(BuildContext context,   ProductPhotoCubit viewModel
) async {
 final result = await showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (_) {
      return  Padding(
        padding: const EdgeInsets.all(16.0),
        child:AddImageProduct(viewModel: viewModel,),
      );
    },
  );

  return result ?? false;
}




