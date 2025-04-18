
import 'package:dashboard_market/features/products/presentation/cubit/products_cubit.dart';
import 'package:flutter/material.dart';




class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key, required this.viewModel});
  final ProductsCubit viewModel;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: .8,
      child: Directionality(
          textDirection: TextDirection.rtl,
          child: Center(
            child: SearchBar(
              elevation: WidgetStateProperty.all<double?>(4.0),
              controller: widget.viewModel.searchController,
              leading: Icon(Icons.search, color: Colors.grey),
              textStyle: WidgetStateProperty.all<TextStyle>(
                TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              hintStyle: WidgetStateProperty.all<TextStyle?>(
                TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              hintText: "ابحث هنا...",
              onChanged: (value) {
                setState(() {
                  widget.viewModel.searchQuery = value;
                });
              },
              trailing: [
                if (widget.viewModel.searchQuery.isNotEmpty)
                  IconButton(
                    icon: Icon(Icons.clear, color: Colors.grey),
                    onPressed: () {
                      setState(() {
                        widget.viewModel.searchController.clear();
                        widget.viewModel.searchQuery = "";
                      });
                    },
                  ),
              ],
            ),
          )),
    );
  }
}
