import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dashboard_market/features/add_images/data/data_sources/images_datasources.dart';
import 'package:dashboard_market/features/add_images/domain/entities/images_entity.dart';
import 'package:flutter/cupertino.dart';

import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';

part 'images_state.dart';

@injectable
class ImagesCubit extends Cubit<ImagesState> {
  final ImagesDataSources _imagesDataSources;

  ImagesCubit(this._imagesDataSources) : super(ImagesInitial());
  int categoryId = 0;
  void changeCategory(int idCategory) {
    categoryId = idCategory;
    // emit(ChangeChangeCategoryImage());
  }


  Future<void> fetchImages() async {
    emit(LoadingImages());
    final result = await _imagesDataSources.getImagesData();
    switch (result) {
      case Success<ImagesEntity?>():
        {
          if (!isClosed) {
            emit(SuccessImages(result.data!));
          }
        }
      case Fail<ImagesEntity>():
        {
          emit(ErrorImages(result.exception));
        }
    }
  }





  // Uint8List? imageBytes;
   File? imageFile;
  TextEditingController nameController = TextEditingController();
final formKey = GlobalKey<FormState>();
  Future<void> upLoadImages() async {
    await _imagesDataSources.upLoadImage(imageFile!, nameController.text, categoryId.toString());
  }

  Future<void> deleteImages(String imageId, String imageName) async {

    await _imagesDataSources.deleteImage(imageId, imageName);
    fetchImages();
  }
}
