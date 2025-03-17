import 'package:dashboard_market/core/di/di.dart';
import 'package:dashboard_market/core/resources/color_manager.dart';
import 'package:dashboard_market/features/add_product/presentation/manager/add_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/add_product_body.dart';


class AddProductView extends StatefulWidget {
  const AddProductView({super.key});

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  late AddProductCubit viewModel;
  @override
  void initState() {
    viewModel=getIt.get<AddProductCubit>();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
      ),
      body: BlocProvider.value(
        value: viewModel,
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              return AddProductBody(viewModel: viewModel,);
            } else {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      color: ColorManager.placeHolderColor,
                    ),
                  ),
                  Expanded(flex: 3, child: AddProductBody(viewModel: viewModel,)),
                  Expanded(
                    child: Container(
                      color: ColorManager.placeHolderColor,
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}


