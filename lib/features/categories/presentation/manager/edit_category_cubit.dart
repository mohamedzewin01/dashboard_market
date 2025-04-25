import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dashboard_market/core/common/api_result.dart';
import 'package:dashboard_market/features/categories/domain/entities/fetch_categories.dart';
import 'package:dashboard_market/features/categories/domain/use_cases/categories_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'edit_category_state.dart';

@injectable
class EditCategoryCubit extends Cubit<EditCategoryState> {
  EditCategoryCubit(this._categoriesUseCase) : super(EditCategoryInitial());
  final CategoriesUseCase _categoriesUseCase;

  static EditCategoryCubit get(context) => BlocProvider.of(context);
  TextEditingController editCategoryNameController =
  TextEditingController(text: "اختر القسم");
  String imagePathEdit = '';
  File? imageFileEdit;
  final formKeyEdit = GlobalKey<FormState>();

  changeNameCategory(String name) {
    editCategoryNameController.text = name;
    emit(EditCategoryChangeImage());
  }

  changeImageCategory(String image) {
    imageFileEdit = null;
    imagePathEdit = image;
    emit(EditCategoryChangeImage());
  }

  Future<void> editCategory({
    required int idCategory,


  }) async {
    emit(EditCategoryLoading());
    var result = await _categoriesUseCase
        .editProductByCategories(categoryId: idCategory,
        categoryName: editCategoryNameController.text,
        oldImagePath: imagePathEdit,
        newImage: imageFileEdit);
    switch (result) {
      case Success<EditCategoryEntity?>():
        {
          emit(EditCategorySuccess(result.data!));
        }
        break;
      case Fail<EditCategoryEntity?>():
        {
          emit(EditCategoryFailure(result.exception));
        }
        break;
    }
  }

  Future<void>deleteCategory({required int idCategory})async{
    emit(EditCategoryLoading());
    var result = await _categoriesUseCase.deleteProductByCategories(46, imagePathEdit);
    switch (result) {
      case Success<DeleteCategoryEntity?>():
        {
          emit(DeleteCategorySuccess(result.data!));
        }
        break;
      case Fail<DeleteCategoryEntity?>():
        {
          emit(DeleteCategoryFailure(result.exception));
        }
        break;
    }
  }
}
