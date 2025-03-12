import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dashboard_market/features/add_images/data/data_sources/images_datasources.dart';
import 'package:dashboard_market/features/add_images/domain/entities/images_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/common/api_result.dart';

part 'images_state.dart';

@injectable
class ImagesCubit extends Cubit<ImagesState> {
  final ImagesDataSources _imagesDataSources;

  ImagesCubit(this._imagesDataSources) : super(ImagesInitial());

  Future<void> fetchImages() async {
    emit(LoadingImages());
    var result = await _imagesDataSources.getImagesData();
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





  Uint8List? imageBytes;
   File? imageFile;
  TextEditingController nameController = TextEditingController();

  Future<void> upLoadImages() async {
    // emit(LoadingImages());
    print('zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz');
    await _imagesDataSources.upLoadImage(imageFile!, nameController.text, '1');
  }
}
