import 'package:cached_network_image/cached_network_image.dart';
import 'package:dashboard_market/core/api/api_constants.dart';
import 'package:dashboard_market/core/resources/assets_manager.dart';
import 'package:dashboard_market/core/resources/color_manager.dart';
import 'package:dashboard_market/core/resources/style_manager.dart';
import 'package:dashboard_market/core/widgets/custom_dialog.dart';
import 'package:dashboard_market/core/widgets/custom_elevated_button.dart';
import 'package:dashboard_market/core/widgets/custom_text_form_field.dart';
import 'package:dashboard_market/features/products/data/models/request/edit_product_request.dart';
import 'package:dashboard_market/features/products/presentation/widgets/edit_product.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class EditProductBody extends StatelessWidget {
  const EditProductBody({
    super.key,
    required this.widget,
    required this.nameController,
    required this.descriptionController,
    required this.priceController,
    required this.newPriceController,
    required this.idProduct,
  });

  final EditProduct widget;
  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final TextEditingController priceController;
  final TextEditingController newPriceController;
  final String idProduct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 15,),
          Flexible(
            child: FittedBox(
              fit: BoxFit.fill,
              child: CachedNetworkImage(
                height: 200,
                width: 200,
                imageUrl:
                '${ApiConstants.baseUrlImage}${widget.product.imageCover}',
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

            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  SizedBox(width: 12,),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child:
                    CustomTextFormField(controller: descriptionController),
                  ),
                  SizedBox(width: 12,),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomTextFormField(
                        keyboardType: TextInputType.number,
                        controller: priceController),
                  ),
                  Expanded(child: SizedBox()),
                  Expanded(
                      flex: 2,
                      child: Text(
                        'السعر الأصلي',
                        style: getSemiBoldStyle(
                            color: ColorManager.black, fontSize: 16),
                        textDirection: TextDirection.rtl,
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: CustomTextFormField(
                        keyboardType: TextInputType.number,
                        controller: newPriceController,
                      ),
                    ),
                  ),
                  Expanded(child: SizedBox()),

                  Expanded(
                    flex: 2,
                    child: Text(
                      'السعر بعد الخصم',
                      style: getSemiBoldStyle(
                          color: ColorManager.black, fontSize: 16),
                      textDirection: TextDirection.rtl,
                    ),),
                ],
              ),
              Text(
                "في حالة عدم وجود خصم يتم وضع صفر (0) في خانة السعر بعد الخصم",
                style: getSemiBoldStyle(color: ColorManager.error),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                spacing: 16,
                children: [
                  Expanded(
                    flex: 1,
                    child: CustomElevatedButton(
                        buttonColor: ColorManager.primaryColor,
                        title: 'رجوع ',
                        onPressed: ()  {
                          Navigator.pop(context);
                        }),
                  ),

                  Expanded(
                    flex: 2,
                    child: CustomElevatedButton(
                        buttonColor: ColorManager.orange,
                        title: 'حفظ',
                        onPressed: () async {
                          print(nameController.text);
                          await widget.viewModel.editProduct(EditProductRequest(
                            idProduct: widget.product.idProduct,
                            productName: nameController.text,
                            description: descriptionController.text,
                            productPrice: priceController.text,
                            productPriceAfterDiscount: newPriceController.text,
                          ));
                          widget.viewModel.getHomeData();
                          if (context.mounted) {
                            Navigator.pop(context);
                          }
                        }),
                  ),

                  Expanded(
                    flex: 1,
                    child: CustomElevatedButton(
                        buttonColor: ColorManager.error,
                        title: 'حذف ',
                        onPressed: () async {
                          CustomDialog.showDeleteDialog(context,
                              onPressed: () async {
                                await widget.viewModel.deleteProduct(
                                  productId: idProduct,
                                );
                                if (context.mounted) {
                                  Navigator.pop(context);

                                }
                              });
                        }),
                  ),

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