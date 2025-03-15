

import 'dart:io';

import 'package:dashboard_market/core/common/api_result.dart';
import 'package:dashboard_market/features/add_images/data/models/delete_image.dart';
import 'package:dashboard_market/features/add_images/domain/entities/delete_image_entity.dart';
import 'package:dashboard_market/features/add_images/domain/entities/image_upload_entity.dart';
import 'package:dashboard_market/features/add_images/domain/entities/images_entity.dart';
import 'package:dashboard_market/features/add_images/domain/repositories/images_repo.dart';
import 'package:injectable/injectable.dart';

import '../data_sources/images_datasources.dart';
@Injectable(as:ImagesRepo )
class ImagesRepoImpl implements ImagesRepo{
  final ImagesDataSources imagesDataSources;
  ImagesRepoImpl(this.imagesDataSources);
  @override
  Future<Result<ImagesEntity?>> fetchImagesData() {
   return imagesDataSources.getImagesData();
  }

  @override
  Future<Result<UpLoadImageEntity?>> upLoadImage(File file, String name, String imageCategory) {
    return imagesDataSources.upLoadImage(file, name, imageCategory);
  }

  @override
  Future<Result<DeleteImageEntity?>> deleteImage(String imageId, String name) {
    // TODO: implement deleteImage
    throw UnimplementedError();
  }
}