import 'package:dashboard_market/features/products/presentation/cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import '../../data/models/request/edit_product_request.dart';
import 'package:dashboard_market/features/products/data/models/response/AllProductsResponse.dart';


class SwitchStatusProducts extends StatefulWidget {
  const SwitchStatusProducts({
    super.key,
    required this.product,
    // required this.viewModel,
  });

  final Products product;
  // final ProductsCubit viewModel;

  @override
  State<SwitchStatusProducts> createState() => _SwitchStatusProductsState();
}

class _SwitchStatusProductsState extends State<SwitchStatusProducts> {
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: .6,
      child: Switch(
        mouseCursor: SystemMouseCursors.click,
        activeTrackColor: Colors.lightGreen.shade400,
        activeColor: Colors.green.shade800,
        inactiveThumbColor: Colors.grey.shade400, // لون المفتاح عند عدم التفعيل
        inactiveTrackColor: Colors.grey.shade300, // لون المسار عند عدم التفعيل
        value: widget.product.status == 1, // حالة المنتج
        onChanged: (value) {
          setState(() {
            // تحديث حالة المنتج عبر ViewModel
            ProductsCubit.get(context).editProduct(
              EditProductRequest(
                idProduct: widget.product.idProduct,
                status: value ? 1 : 0,
              ),
            );
            // تحديث حالة المنتج محليًا
            widget.product.status = value ? 1 : 0;
          });
        },
      ),

    );
  }
}
