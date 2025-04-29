import 'package:dashboard_market/core/resources/products_selected.dart';
import 'package:flutter/material.dart';
import 'package:dashboard_market/features/products/data/models/response/AllProductsResponse.dart';

class SelectProduct extends StatefulWidget {
  const SelectProduct({
    super.key,
    this.products,
  });

  final Products? products;

  @override
  State<SelectProduct> createState() => _SelectProductState();
}

class _SelectProductState extends State<SelectProduct> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isChecked =
        ProductsSelected.isProductProduct[widget.products!.idProduct] ?? false;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: () {
          final newValue = !isChecked;
          setState(() {
            ProductsSelected.setProductsProduct(
              widget.products!.idProduct!.toInt(),
              newValue,
            );
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: isChecked ? Color(0xFF008080) : Colors.white, // Teal
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: isHovered ? Color(0xFF20B2AA) : Color(0xFF008080),
              width: 2,
            ),
            boxShadow: [
              if (isHovered)
                BoxShadow(
                  color: Color(0xFF20B2AA).withOpacity(0.3), // Lighter Teal shadow
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
            ],
          ),
          child: Icon(
            isChecked ? Icons.check : Icons.close,
            color: isChecked ? Colors.white : Colors.grey[600],
            size: 16,
          ),
        ),
      ),
    );
  }
}
