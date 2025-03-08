import 'package:flutter/material.dart';

import '../../data/models/response/AllProductsRespose.dart';

class SwitchStatusProducts extends StatefulWidget {
  const SwitchStatusProducts({
    super.key,
    required this.product,
  });

  final Products product;

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
        inactiveTrackColor: Colors.grey,
        value: widget.product.status == 1,
        onChanged: (value) {
          setState(() {
            widget.product.status = value ? 1 : 0;
          });
          widget.product.status == 0;
        },
      ),
    );
  }
}
