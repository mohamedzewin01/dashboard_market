import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dashboard_market/core/resources/style_manager.dart';
import 'package:dashboard_market/core/widgets/custom_elevated_button.dart';
import 'package:dashboard_market/core/widgets/custom_text_form_field.dart';
import 'package:dashboard_market/features/products/data/models/request/edit_product_request.dart';
import 'package:dashboard_market/features/products/presentation/widgets/edit_product_body.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/api/api_constants.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';

import '../../../../core/widgets/custom_dialog.dart';
import '../../data/models/response/AllProductsRespose.dart';
import '../cubit/home_cubit.dart';

class EditProduct extends StatefulWidget {
  const EditProduct(
      {super.key, required this.viewModel, required this.product});

  final ProductsCubit viewModel;
  final Products product;

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController newPriceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = widget.product.productName ?? '';
    priceController.text = widget.product.productPrice.toString();
    newPriceController.text =
        widget.product.productPriceAfterDiscount.toString();
    descriptionController.text = widget.product.description ?? '';
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.productName ?? ''),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.close_outlined,
            color: ColorManager.error,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return EditProductBody(
                idProduct: widget.product.idProduct.toString(),
                widget: widget,
                nameController: nameController,
                descriptionController: descriptionController,
                priceController: priceController,
                newPriceController: newPriceController);
          } else {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: double.infinity,
                    color: ColorManager.placeHolderColor,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: EditProductBody(
                      idProduct: widget.product.idProduct.toString(),
                      widget: widget,
                      nameController: nameController,
                      descriptionController: descriptionController,
                      priceController: priceController,
                      newPriceController: newPriceController),
                ),
                Expanded(
                    child: Container(
                  height: double.infinity,
                  color: ColorManager.placeHolderColor,
                ))
              ],
            );
          }
        },
      ),
    );
  }
}
