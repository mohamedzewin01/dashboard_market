import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dashboard_market/core/resources/style_manager.dart';
import 'package:dashboard_market/core/widgets/custom_elevated_button.dart';
import 'package:dashboard_market/core/widgets/custom_text_form_field.dart';
import 'package:dashboard_market/features/products/data/models/request/edit_product_request.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/api/api_constants.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';

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
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return EditProductBody(
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

class EditProductBody extends StatelessWidget {
  const EditProductBody({
    super.key,
    required this.widget,
    required this.nameController,
    required this.descriptionController,
    required this.priceController,
    required this.newPriceController,
  });

  final EditProduct widget;
  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final TextEditingController priceController;
  final TextEditingController newPriceController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: FittedBox(
              fit: BoxFit.fill,
              child: CachedNetworkImage(
                height: 200,
                width: 200,
                imageUrl:
                    '${ApiConstants.baseUrlImage}${widget.product.imageCover}',
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Skeletonizer(
                  child: Image.asset(
                    Assets.assetsImagesImageDefault,
                  ),
                ),
                errorWidget: (context, url, error) => Image.asset(
                  Assets.assetsImagesImageDefault,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Column(
            spacing: 16,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomTextFormField(
                      // keyboardType: TextInputType.multiline,
                      maxLines: 2,
                      minLines: 1,
                      controller: nameController,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'اسم الصنف',
                      style: getSemiBoldStyle(
                          color: ColorManager.black, fontSize: 16),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child:
                        CustomTextFormField(controller: descriptionController),
                  ),
                  Expanded(
                    child: Text(
                      'تفاصيل',
                      style: getSemiBoldStyle(
                          color: ColorManager.black, fontSize: 16),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomTextFormField(
                        keyboardType: TextInputType.number,
                        controller: priceController),
                  ),
                  Expanded(child: SizedBox()),
                  Expanded(
                      child: Text(
                    'السعر قبل الخصم',
                    style: getSemiBoldStyle(
                        color: ColorManager.black, fontSize: 16),
                    textDirection: TextDirection.rtl,
                  )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomTextFormField(
                      keyboardType: TextInputType.number,
                      controller: newPriceController,
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Expanded(
                      child: Text(
                    'السعر النهائي',
                    style: getSemiBoldStyle(
                        color: ColorManager.black, fontSize: 16),
                    textDirection: TextDirection.rtl,
                  )),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Spacer(),
                  Expanded(
                    flex: 2,
                    child: CustomElevatedButton(
                        buttonColor: ColorManager.orange,
                        title: 'حفظ',
                        onPressed: () async {
                          print(nameController.text);
                        await  widget.viewModel.editProduct(EditProductRequest(
                            idProduct: widget.product.idProduct,
                            productName: nameController.text,
                            description: descriptionController.text,
                            productPrice:priceController.text,

                            productPriceAfterDiscount: newPriceController.text,
                          ));
                         widget. viewModel.getHomeData();
                        if(context.mounted){
                          Navigator.pop(context);
                        }

                        }),
                  ),
                  Spacer(),
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
