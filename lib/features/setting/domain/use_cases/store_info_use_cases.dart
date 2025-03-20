import 'dart:io';

import 'package:dashboard_market/core/common/api_result.dart';
import 'package:dashboard_market/features/add_images/domain/entities/delete_image_entity.dart';
import 'package:dashboard_market/features/add_images/domain/entities/image_upload_entity.dart';
import 'package:dashboard_market/features/add_images/domain/entities/images_entity.dart';
import 'package:dashboard_market/features/add_images/domain/repositories/images_repo.dart';
import 'package:dashboard_market/features/categories/domain/entities/fetch_categories.dart';
import 'package:dashboard_market/features/categories/domain/repositories/categories_repo.dart';
import 'package:dashboard_market/features/setting/domain/entities/store_entity.dart';
import 'package:dashboard_market/features/setting/domain/repositories/store_info_repo.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/store_info_request.dart';

@injectable
class StoreInfoUseCases {
  StoreInfoRepo storeInfoRepo;

  StoreInfoUseCases(this.storeInfoRepo);

  Future<Result<StoreInfoEntity?>> getStoreInfo() =>
      storeInfoRepo.getStoreInfo();

  Future<Result<StoreInfoEditEntity?>> editStoreInfo(
          StoreInfoRequest? storeInfoRequest) =>
      storeInfoRepo.editStoreInfo(storeInfoRequest);

  Future<Result<UploadImageStoreEntity?>> uploadImageStore(File imageFile,String imagePath){
    return storeInfoRepo.uploadImageStore(imageFile, imagePath);
  }
}
