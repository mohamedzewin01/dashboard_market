import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dashboard_market/core/common/api_result.dart';
import 'package:dashboard_market/features/add_product/data/models/images_dto.dart';
import 'package:dashboard_market/features/add_product/domain/entities/add_product_entity.dart';
import 'package:dashboard_market/features/add_product/domain/use_cases/add_product_use_case.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'product_photo_state.dart';

@injectable
class ProductPhotoCubit extends Cubit<ProductPhotoState> {
  ProductPhotoCubit(this._addProductUseCase) : super(ProductPhotoInitial());
  final AddProductUseCase _addProductUseCase;

  File? imageFile;
  int categoryId = 0;
  List<AllImages>? filteredImages = [];

  void changeCategory(int idCategory) {
    categoryId = idCategory;
    // emit(ChangeChangeCategoryImage());
  }
  TextEditingController nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> upLoadImages() async {
    await _addProductUseCase.upLoadProductImage(
        imageFile!, nameController.text, categoryId.toString());
  }

  Future<void> fetchImages() async {
    emit(ProductPhotoLoading());
    final result = await _addProductUseCase.getAllImages();
    switch (result) {
      case Success<AllImagesEntity?>():
        {
          if (!isClosed) {
            filteredImages=result.data!.images?.reversed.toList();
            emit(ProductPhotoSuccess(result.data!));
          }
        }
      case Fail<AllImagesEntity?>():
        {
          emit(ProductPhotoFail(result.exception));
        }
    }
  }

  Future<void> deleteProductImages(String imageId, String imageName) async {
    await _addProductUseCase.deleteProductImage(imageId, imageName);
    fetchImages();
  }
}
