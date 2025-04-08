


import 'dart:io';

import 'package:dashboard_market/core/common/api_result.dart';
import 'package:dashboard_market/features/add_images/data/models/delete_image.dart';

import '../entities/delete_image_entity.dart';
import '../entities/image_upload_entity.dart';
import '../entities/images_entity.dart';

abstract class ImagesRepo {

  Future<Result<ImagesEntity?>>fetchImagesData();
  Future<Result<UpLoadImageEntity?>>upLoadImage(File file, String name, String imageCategory);
  Future<Result<DeleteImageEntity?>>deleteImage(String imageId, String name);
}