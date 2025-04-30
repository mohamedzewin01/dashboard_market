import 'package:dashboard_market/features/product_edit/data/models/request/edit_product_request.dart';
import 'package:dashboard_market/features/product_edit/domain/use_cases/products_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'edit_product_state.dart';

@injectable
class EditProductCubit extends Cubit<EditProductState> {
  EditProductCubit(this._productsEditUseCase) : super(EditProductInitial());

  static EditProductCubit get(context) => BlocProvider.of(context);
  final ProductsEditUseCase _productsEditUseCase;

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController newPriceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  int? selectedCategoryId;

  void changeCategory(int idCategory) {
    selectedCategoryId = idCategory;
    emit(ChangeChangeCategory());
  }

  Future<void> editProduct({required String idProduct}) async {
    final EditProductRequestDto editProductRequest = EditProductRequestDto(
      productName: nameController.text,
      description: descriptionController.text,
      productPriceAfterDiscount: newPriceController.text,
      category: selectedCategoryId,
      productPrice: priceController.text,
      idProduct: int.parse(idProduct),
    );

    await _productsEditUseCase.editProductsData(editProductRequest);
  }

  Future<void> deleteProduct({required String productId}) async {
    await _productsEditUseCase.deleteProductsData(productId);
  }
}
