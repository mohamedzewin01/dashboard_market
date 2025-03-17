import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/common/api_result.dart';
import '../../data/models/request/edit_product_request.dart';
import '../../domain/entities/products_entities.dart';
import '../../domain/use_cases/products_use_case.dart';

part 'home_state.dart';

@injectable
class ProductsCubit extends Cubit<ProductsState> {
  final HomeUseCase _homeUseCase;

  ProductsCubit(this._homeUseCase) : super(ProductsInitial());

  Future<void> getHomeData() async {
    emit(ProductsLoading());
    final result = await _homeUseCase.getProductsData();
    switch (result) {
      case Success<ProductsEntity?>():
        {
          if (!isClosed) {
            emit(ProductsSuccess(result.data));
          }
        }
      case Fail<ProductsEntity>():
        {
          if (!isClosed) emit(ProductsFail(result.exception));
          log('HomeCubit: getHomeData: ${result.exception}');
        }
    }
  }
TextEditingController searchController = TextEditingController();
  String searchQuery = "";

  Future<void> editProduct(EditProductRequest editProductRequest) async {

    await _homeUseCase.editProductsData(editProductRequest);
    log('Success');
  }
}
