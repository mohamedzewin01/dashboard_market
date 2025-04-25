import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/common/api_result.dart';
import '../../domain/entities/fetch_categories.dart';
import '../../domain/use_cases/categories_use_case.dart';

part 'categories_state.dart';

@injectable
class CategoriesCubit extends Cubit<CategoriesState> {


  CategoriesCubit(this._categoriesUseCase) : super(CategoriesInitial());
  final CategoriesUseCase _categoriesUseCase;
static CategoriesCubit get(context) => BlocProvider.of(context);




  TextEditingController categoryNameController = TextEditingController();

  final formKey = GlobalKey<FormState>();


  Future<void> getCategoriesData() async {
    emit(CategoriesLoading());
    final result = await _categoriesUseCase.getCategoriesData();
    switch (result) {
      case Success<FetchCategoriesEntity?>():
        {
          if (!isClosed) {
            emit(CategoriesSuccess(result.data!));
          }
        }
        break;
      case Fail<FetchCategoriesEntity?>():
        {
          emit(CategoriesFailure(result.exception));
        }
        break;
    }
  }





  String imagePath = '';
  int status = 1;
  File? imageFile;
  Future<void> addCategory() async {
     await _categoriesUseCase.addCategory(
        imageFile!, categoryNameController.text, status);

  }




}
