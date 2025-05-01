import 'package:dashboard_market/core/resources/cashed_image.dart';
import 'package:dashboard_market/core/widgets/custom_dialog.dart';
import 'package:dashboard_market/features/add_product/presentation/widgets/show_all_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../home/presentation/pages/home_view.dart';
import '../manager/add_product_cubit.dart';
import 'choose_categories.dart';

class AddProductBody extends StatelessWidget {
  const AddProductBody({
    super.key,
    required this.viewModel,
  });

  final AddProductCubit viewModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          CustomDialog.showSuccessDialog(context, goto: const HomeView());
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: viewModel.formKey,
            child: SingleChildScrollView(
              child: Column(
                spacing: 5,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: IconButton(
                      splashColor: Colors.transparent,
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          elevation: 8,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          builder: (context) => ShowAllImagesToAddProduct(
                            addProductCubit: viewModel,
                          ),
                        );
                      },
                      highlightColor: Colors.transparent,
                      mouseCursor: SystemMouseCursors.click,
                      icon: viewModel.imagePath.isNotEmpty
                          ? AspectRatio(
                              aspectRatio: 20 / 9,
                              child: Container(
                                clipBehavior: Clip.antiAlias,

                                width: double.infinity, // Take full width
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: CustomImage(url: viewModel.imagePath),
                              ),
                            )
                          : Container(
                              height: 150,
                              width: double.infinity, // Take full width
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(color: Colors.grey[400]!),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.image_outlined,
                                      size: 50, color: Colors.grey[600]),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Upload product image',
                                    style: TextStyle(color: Colors.grey[700]),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'PNG, JPG up to 5MB',
                                    style: TextStyle(
                                        color: Colors.grey[600], fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                    ),
                  ),
                  CustomTextFormField(
                    controller: viewModel.productNameController,
                    validator: (value) {
                      if (value!.trim().isEmpty) return 'ادخل اسم المنتج';
                      if (value.trim().length < 3) return 'الاسم قصير جدا';
                      return null;
                    },
                    labelText: "اسم المنتج",
                    hintText: "اسم المنتج",
                  ),
                  CustomTextFormField(
                    controller: viewModel.descriptionController,
                    validator: (value) {
                      if (value!.trim().isEmpty) return 'ادخل موصفات المنتج';
                      if (value.trim().length < 3) {
                        return 'موصفات المنتج قصير جدا';
                      }
                      return null;
                    },
                    labelText: "موصفات المنتج",
                    hintText: "موصفات المنتج",
                  ),
                  Row(
                    spacing: 16,
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          controller: viewModel.productPriceController,
                          labelText: "السعر الاساسي",
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return 'ادخل سعر المنتج ';
                            }
                            final RegExp priceRegExp = RegExp(r'^\d+(\.\d{1,2})?$');
                            if (!priceRegExp.hasMatch(value)) {
                              return 'الرجاء إدخال سعر صحيح';
                            }
                            return null;
                          },
                          hintText: "0",
                        ),
                      ),
                      Expanded(
                        child: CustomTextFormField(
                          controller: viewModel.priceAfterController,
                          validator: (value) {
                            // if (value!.trim().isEmpty) {
                            //   return 'ادخل سعر المنتج بعد الخصم';
                            // }
                            final RegExp priceRegExp = RegExp(r'^\d+(\.\d{1,2})?$');
                            if (!priceRegExp.hasMatch(value!)) {
                              return 'الرجاء إدخال سعر صحيح';
                            }
                            final double discountedPrice =
                                double.tryParse(value.trim()) ?? 0.0;
                            final double originalPrice = double.tryParse(viewModel
                                    .productPriceController.text
                                    .trim()) ??
                                0.0;
                            if (discountedPrice >= originalPrice) {
                              return 'السعر بعد الخصم يجب أن يكون أقل من سعر المنتج';
                            }

                            return null;
                          },
                          labelText: "السعر بعد الخصم",
                          hintText: "0",
                        ),
                      ),

                    ],
                  ),
                  Text(
                    "في حالة عدم وجود خصم يتم وضع صفر (0) في خانة السعر بعد الخصم",
                    style: getSemiBoldStyle(color: ColorManager.error),
                  ),
                  Row(
                    spacing: 16,
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<int>(
                          decoration: InputDecoration(
                            labelText: 'الحالة',
                            labelStyle: const TextStyle(fontSize: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          items: [
                            DropdownMenuItem(
                                value: 1,
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.check,
                                      color: Colors.green,
                                    ),
                                    Text(
                                      'نشر حالا',
                                      style: getSemiBoldStyle(
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                )),
                            DropdownMenuItem(
                                value: 0,
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.close,
                                      color: ColorManager.error,
                                    ),
                                    Text(
                                      'عدم النشر ',
                                      style: getSemiBoldStyle(
                                        color: ColorManager.error,
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                          onChanged: (value) {
                            viewModel.changeProductStatus(value!);
                          },
                          validator: (value) {
                            if (value == null) {
                              return 'الرجاء اختيار الحالة';
                            }
                            return null;
                          },
                        ),
                      ),
                      Expanded(
                        child: ChooseCategories(addProductCubit: viewModel),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomElevatedButton(
                          buttonColor: ColorManager.orange,
                          title: 'اضافة',
                          onPressed: () {
                            if (viewModel.formKey.currentState!.validate()) {
                              viewModel.addProduct();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
