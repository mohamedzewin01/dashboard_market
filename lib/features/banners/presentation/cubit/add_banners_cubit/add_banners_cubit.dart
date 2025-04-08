import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dashboard_market/core/common/api_result.dart';
import 'package:dashboard_market/core/functions/reduce_image_size.dart';
import 'package:dashboard_market/features/banners/domain/entities/banners_entity.dart';
import 'package:dashboard_market/features/banners/domain/use_cases/banners_use_cases.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'add_banners_state.dart';


@injectable
class AddBannersCubit extends Cubit<AddBannersState> {
  AddBannersCubit(this._bannersUseCases) : super(AddBannersInitial());
  final BannersUseCases _bannersUseCases;

  Uint8List? imageBytes;
  File? imageFile;
  int status = 0; // أو 1 حسب الحالة الافتراضية

  void changeStatus(bool value) {
    status = value ? 1 : 0;
    emit(AddBannersChangeStatus()); // حالة عشان يحصل rebuild
  }


  changeImage(File file) {
    imageFile = file;
    emit(AddBannersChangeImage());
  }

  Future<void> addBanners() async {
    emit(AddBannersLoading());
    final result = await _bannersUseCases.addBanners(bannerTitleController.text,
        bannerSubTitleController.text, 0, imageFile!, status);

    switch (result) {
      case Success<AddBannersEntity?>():
        if (!isClosed) {
          bannerTitleController.clear();
          bannerSubTitleController.clear();
          imageFile = null;
          emit(AddBannersSuccess(result.data!));
        }
      case Fail<AddBannersEntity?>():
        if (!isClosed) {
          emit(AddBannersFailure(result.exception));
        }
    }
  }

  TextEditingController bannerTitleController = TextEditingController();
  TextEditingController bannerSubTitleController = TextEditingController();


  changeTitle(String title) {
    bannerTitleController.text = title;
    emit(AddBannersChangeTitle());
  }
  changeSubTitle(String title) {
    bannerSubTitleController.text = title;
    emit(AddBannersChangeSubTitle());
  }

  final formKey = GlobalKey<FormState>();

  Future<File?> pickImageBanner() async {
    final XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      final File originalImageFile = File(xFile.path);
      final String extension = xFile.path.split('.').last.toLowerCase();

      if (extension == 'webp') {

          imageFile= originalImageFile;
          changeImage(originalImageFile);
        return originalImageFile;
      }

      final File resizedImageFile = await resizeAndCompressImage(
        imageFile: originalImageFile,
      );

        imageFile= resizedImageFile;
      changeImage(resizedImageFile);

      return resizedImageFile;
    }

    return null;
  }
}
