import 'dart:io';

import 'package:dashboard_market/core/common/api_result.dart';
import 'package:dashboard_market/features/categories/domain/entities/fetch_categories.dart';
import 'package:dashboard_market/features/categories/domain/use_cases/categories_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

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
  int? idCategory;

  void changeNameCategory(String name,int idCategory) {
    editCategoryNameController.text = name;
    this.idCategory = idCategory;
    emit(EditCategoryChangeImage());
  }

  void changeImageCategory(String image) {
    imageFileEdit = null;
    imagePathEdit = image;
    emit(EditCategoryChangeImage());
  }

  Future<void> editCategory() async {
    emit(EditCategoryLoading());
    final result = await _categoriesUseCase
        .editProductByCategories(
        categoryId: idCategory??0,
        categoryName: editCategoryNameController.text,
        oldImagePath: imagePathEdit,
        newImage: imageFileEdit);
    switch (result) {
      case Success<EditCategoryEntity?>():
        {
          imagePathEdit = '';
          imageFileEdit = null;
          idCategory = null;
          editCategoryNameController.clear();
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

  Future<void>deleteCategory()async{
    emit(EditCategoryLoading());
    final result = await _categoriesUseCase.deleteProductByCategories(idCategory??0, imagePathEdit);
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

  // TextEditingController categoryNameController = TextEditingController();
  //
  // final formKey = GlobalKey<FormState>();
  // String imagePath = '';
  // int status = 1;
  // File? imageFile;
  // Future<void> addCategory() async {
  //   await _categoriesUseCase.addCategory(
  //       imageFile!, categoryNameController.text, status);
  //
  // }

}
