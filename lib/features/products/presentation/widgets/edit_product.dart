import 'package:cached_network_image/cached_network_image.dart';
import 'package:dashboard_market/core/widgets/custom_elevated_button.dart';
import 'package:dashboard_market/features/products/data/models/request/edit_product_request.dart';
import 'package:dashboard_market/features/products/presentation/widgets/switch_status_products.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/widgets/custom_riyal_saudi.dart';
import '../../data/models/response/AllProductsRespose.dart';
import '../cubit/home_cubit.dart';

class EditProduct extends StatelessWidget {
  const EditProduct(
      {super.key, required this.viewModel, required this.product});

  final HomeCubit viewModel;
  final Products product;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'تعديل بيانات المنتج',
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: GoogleFonts.roboto(color: ColorManager.black),
      ),
      content: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            // to make the row take minimum
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: Flexible(
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: CachedNetworkImage(
                      height: 200,
                      width: 200,
                      imageUrl:
                          '${ApiConstants.baseUrlImage}${product.imageCover}',
                      fit: BoxFit.cover,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Skeletonizer(
                              child: Image.asset(
                        Assets.assetsImagesImageDefault,
                      )),
                      errorWidget: (context, url, error) => Image.asset(
                        Assets.assetsImagesImageDefault,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    product.productName ?? '',
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.rtl,
                    style: GoogleFonts.roboto(
                        color: ColorManager.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          product.description ?? '',
                          textDirection: TextDirection.rtl,
                          maxLines: 1,
                          textAlign: TextAlign.right,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: ColorManager.primary,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      product.productPrice != 0
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const CustomRiyalSaudi(
                                  color: ColorManager.primary,
                                  size: 12,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  product.productPrice.toString(),
                                  style: const TextStyle(
                                    color: ColorManager.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: ColorManager.primary,
                                    decorationThickness: 2,
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox(),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomRiyalSaudi(),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            product.productPriceAfterDiscount.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                                color: ColorManager.error),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
          product.productPrice == 0
              ? SizedBox()
              : Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                      decoration: BoxDecoration(
                          color: ColorManager.error,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(8))),
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Text("${product.descount}%",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.white)),
                          Text("خصم",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.white))
                        ],
                      )),
                ),
          Positioned(
            top: 0, // to shif6t little up
            right: 0,
            child: SwitchStatusProducts(viewModel: viewModel, product: product),
          )
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomElevatedButton(
                buttonColor: ColorManager.grey,
                title: 'الغاء',
                onPressed: () {
                  Navigator.pop(context);
                }),
            CustomElevatedButton(
                buttonColor: ColorManager.orange,
                title: 'حفظ',
                onPressed: () {
                  viewModel.editProduct(EditProductRequest(
                      idProduct: product.idProduct, status: product.status));
                  Navigator.pop(context);
                }),
          ],
        )
      ],
    );
  }
}
