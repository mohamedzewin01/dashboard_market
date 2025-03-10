import 'package:flutter/material.dart';

import '../../data/models/request/edit_product_request.dart';
import '../../data/models/response/AllProductsRespose.dart';
import '../cubit/home_cubit.dart';

class SwitchStatusProducts extends StatefulWidget {
  const SwitchStatusProducts({
    super.key,
    required this.product,
    required this.viewModel,
  });

  final Products product;
  final ProductsCubit viewModel;

  @override
  State<SwitchStatusProducts> createState() => _SwitchStatusProductsState();
}

class _SwitchStatusProductsState extends State<SwitchStatusProducts> {
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: .6,
      child: Switch(
        mouseCursor: MouseCursor.defer,
        // hoverColor: ColorManager.orange,
        activeTrackColor: Colors.green,
        activeColor: Colors.white,
        inactiveThumbColor:Colors.grey,
        inactiveTrackColor: Colors.white,
        value: widget.product.status == 1,
        onChanged: (value) {
          setState(() {
            widget.viewModel.editProduct(
              EditProductRequest(
                  idProduct: widget.product.idProduct, status: value ? 1 : 0),
            );
            widget.product.status = value ? 1 : 0;
          });
          widget.product.status == 0;
        },
      ),
    );
  }
}
