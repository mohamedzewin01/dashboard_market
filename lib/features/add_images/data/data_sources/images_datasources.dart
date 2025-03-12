import 'dart:io';

import 'package:dashboard_market/core/api/api_extentions.dart';
import 'package:dashboard_market/core/api/api_manager/api_manager.dart';
import 'package:dashboard_market/core/common/api_result.dart';
import 'package:dashboard_market/features/add_images/domain/entities/images_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/image_upload_entity.dart';

@injectable
class ImagesDataSources {
  ApiService apiService;

  ImagesDataSources({required this.apiService});

  Future<Result<ImagesEntity?>> getImagesData() async {
    return executeApi(
      () async {
        var response = await apiService.getImagesData();
        return response?.toImagesEntity();
      },
    );
  }

  Future<Result<UpLoadImageEntity?>> upLoadImage(
      File file, String name, String imageCategory) async {
    return executeApi(
      () async {
        var response = await apiService.uploadImage(file, name, imageCategory);
        return response?.toUpLoadImageEntity();
      },
    );
  }
}
