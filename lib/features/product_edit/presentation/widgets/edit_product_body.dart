import 'package:cached_network_image/cached_network_image.dart';
import 'package:dashboard_market/core/api/api_constants.dart';
import 'package:dashboard_market/core/di/di.dart';
import 'package:dashboard_market/core/resources/assets_manager.dart';
import 'package:dashboard_market/core/resources/color_manager.dart';
import 'package:dashboard_market/core/resources/style_manager.dart';
import 'package:dashboard_market/core/widgets/custom_dialog.dart';
import 'package:dashboard_market/core/widgets/custom_elevated_button.dart';
import 'package:dashboard_market/core/widgets/custom_text_form_field.dart';
import 'package:dashboard_market/features/product_edit/data/models/request/edit_product_request.dart';
import 'package:dashboard_market/features/product_edit/presentation/manager/edit_product_cubit.dart';
import 'package:dashboard_market/features/product_edit/presentation/pages/edit_product.dart';
import 'package:dashboard_market/features/product_edit/presentation/widgets/change_categories.dart';
import 'package:dashboard_market/features/products/presentation/cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class EditProductBody extends StatelessWidget {
  const EditProductBody({
    super.key,
    required this.widget,

    required this.idProduct,
    required this.viewModel,
  });

  final EditProduct widget;

  final String idProduct;
  final EditProductCubit viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 15,
            ),
            CachedNetworkImage(
              height: 100,
              width: 100,
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
            SizedBox(
              height: 16,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextFormField(
                  labelText:    'اسم الصنف',
                  maxLines: 2,
                  minLines: 1,
                  controller: viewModel.nameController,
                ),

                CustomTextFormField(
                    labelText:   'تفاصيل',
                    controller:  viewModel.descriptionController),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        labelText: 'السعر الأصلي',
                          keyboardType: TextInputType.number,
                          controller: viewModel. priceController,


                      ),
                    ),
                    SizedBox(
                      width: 5,),
                    Expanded(
                      child: CustomTextFormField(

                        labelText:"السعر بعد الخصم" ,
                        keyboardType: TextInputType.number,
                        controller:  viewModel.newPriceController,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,),
                ChangeCategories(
                  categoryId: widget.product.category,
                ),
                SizedBox(
                  height: 5,),
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
                          onPressed: () {
                            Navigator.pop(context); // هذا يكفي للرجوع
                          }),
                    ),
                    Expanded(
                      flex: 2,
                      child: CustomElevatedButton(
                          buttonColor: ColorManager.orange,
                          title: 'حفظ',
                          onPressed: () async {
                            // إرسال طلب التعديل
                            await viewModel
                                .editProduct(idProduct:idProduct)
                                .then((value) async {
                              if (context.mounted) {
                                Navigator.pop(context, true);
                              }
                            });
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
                              await viewModel.deleteProduct(
                                  productId: idProduct);
                              if (context.mounted) {
                                Navigator.pop(context, true);
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
      ),
    );
  }
}
