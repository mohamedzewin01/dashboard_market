import 'package:dashboard_market/core/di/di.dart';
import 'package:dashboard_market/features/product_edit/presentation/manager/edit_product_cubit.dart';
import 'package:dashboard_market/features/product_edit/presentation/widgets/edit_product_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../products/data/models/response/AllProductsRespose.dart';

class EditProduct extends StatefulWidget {
  const EditProduct({super.key, required this.product});

  final Products product;

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  late EditProductCubit viewModel;

  @override
  void initState() {
    viewModel = getIt.get<EditProductCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    viewModel.nameController.text = widget.product.productName ?? '';
    viewModel.priceController.text = widget.product.productPrice.toString();
    viewModel.newPriceController.text =
        widget.product.productPriceAfterDiscount.toString();
    viewModel.descriptionController.text = widget.product.description ?? '';
    return BlocProvider.value(
      value: viewModel,
      child: Scaffold(
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

                viewModel: viewModel,
              );
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
                      viewModel: viewModel,
                    ),
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
      ),
    );
  }
}
