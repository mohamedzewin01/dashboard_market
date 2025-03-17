import 'package:bloc/bloc.dart';
import 'package:dashboard_market/features/add_product/domain/entities/add_product_entity.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/common/api_result.dart';
import '../../domain/use_cases/add_product_use_case.dart';

part 'add_product_state.dart';

@injectable
class AddProductCubit extends Cubit<AddProductState> {
  final AddProductUseCase _addProductUseCase;

  AddProductCubit(this._addProductUseCase) : super(AddProductInitial());

  String imagePath = '';
  int status = 0;
  int categoryId = 1;

  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController priceAfterController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateDiscountController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void changeImagePath(String path) {
    imagePath = path;
    emit(ChangeImage());
  }
  void changeProductStatus(int statusProduct) {
    status = statusProduct;
    emit(ChangeProductStatus());
  }
  void changeCategory(int idCategory) {
    categoryId = idCategory;
    emit(ChangeChangeCategory());
  }

  Future<void> addProduct() async {
    emit(AddProductLoading());

    var result = await _addProductUseCase.addProduct(
        productName: productNameController.text,
        productPrice: double.parse(productPriceController.text),
        priceAfter: double.parse(priceAfterController.text),
        description: descriptionController.text,
        dateDiscount: 'تموينات فضاء الخليج',
        status: status,
        imagePath: imagePath,
        categoryId: categoryId);
    switch (result) {
      case Success<AddProductEntity?>():
        {
          emit(AddProductSuccess(result.data));
        }
        break;
      case Fail<AddProductEntity?>():
        {
          emit(AddProductFailure(result.exception));
        }
        break;
    }
  }
}
