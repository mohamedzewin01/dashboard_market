import 'dart:io';

import 'package:dashboard_market/core/common/api_result.dart';
import 'package:dashboard_market/features/add_images/domain/entities/delete_image_entity.dart';
import 'package:dashboard_market/features/add_images/domain/entities/image_upload_entity.dart';
import 'package:dashboard_market/features/add_images/domain/entities/images_entity.dart';
import 'package:dashboard_market/features/add_images/domain/repositories/images_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ImagesUseCase {
  ImagesRepo imagesRepo;

  ImagesUseCase(this.imagesRepo);

  Future<Result<ImagesEntity?>> getImagesData() => imagesRepo.fetchImagesData();

  Future<Result<UpLoadImageEntity?>> uploadImage(
          File file, String name, String imageCategory) =>
      imagesRepo.upLoadImage(file, name, imageCategory);


  Future<Result<DeleteImageEntity?>> deleteImage(
      String imageId, String name) =>
      imagesRepo.deleteImage(imageId, name);
}
