import 'package:cached_network_image/cached_network_image.dart';
import 'package:dashboard_market/features/products/presentation/cubit/products_cubit.dart';
import 'package:dashboard_market/features/products/presentation/widgets/switch_status_products.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/api/api_constants.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/custom_riyal_saudi.dart';
import '../../data/models/response/AllProductsRespose.dart';

class CustomProductsAllItem extends StatelessWidget {
  const CustomProductsAllItem({
    super.key,
    required this.product,
    this.onTap,
    // required this.viewModel,
  });

  final Products product;
  // final ProductsCubit viewModel;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: ColorManager.placeHolderColor),
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: CachedNetworkImage(
                        imageUrl:
                        '${ApiConstants.baseUrlImage}${product.imageCover}',
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
                // Divider(),
                Column(
                  children: [
                    Text(
                      product.productName ?? '',
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.rtl,
                      style: getSemiBoldStyle(
                        color: ColorManager.black,
                        fontSize: 14,
                      ),
                      maxLines: 1,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              product.description ?? '',
                              textDirection: TextDirection.rtl,
                              maxLines: 1,
                              textAlign: TextAlign.right,
                              overflow: TextOverflow.ellipsis,
                              style: getSemiBoldStyle(
                                color: ColorManager.primary,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Divider(
                      color: ColorManager.placeHolderColor,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment:
                        product.productPriceAfterDiscount != 0
                            ? MainAxisAlignment.spaceEvenly
                            : MainAxisAlignment.center,
                        children: [
                          product.productPriceAfterDiscount != 0
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
                              : Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CustomRiyalSaudi(
                                color: ColorManager.error,
                                size: 12,
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                product.productPrice.toString(),
                                style: const TextStyle(
                                  color: ColorManager.error,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  decorationColor: ColorManager.primary,
                                  decorationThickness: 2,
                                ),
                              ),
                            ],
                          ),
                          product.productPriceAfterDiscount != 0
                              ? VerticalDivider(
                            color: ColorManager.placeHolderColor,
                          )
                              : SizedBox(),
                          product.productPriceAfterDiscount == 0
                              ? SizedBox()
                              : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomRiyalSaudi(),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                product.productPriceAfterDiscount
                                    .toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                    color: ColorManager.error),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          product.productPriceAfterDiscount == 0
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
            top: 0, // to shift little up
            right: 0,
            child: SwitchStatusProducts(
              // viewModel: viewModel,
                product: product),
          ),
          // Positioned(
          //   top: 45, // to shift little up
          //   right: 10,
          //   child:,
          // ),
          // Positioned(
          //   top: 35, // to shift little up
          //   left: 0,
          //   child: Text(product.),
          // )
        ],
      ),
    );
  }
}


