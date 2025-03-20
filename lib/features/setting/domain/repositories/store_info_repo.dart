


import 'dart:io';

import 'package:dashboard_market/features/setting/domain/entities/store_entity.dart';

import '../../../../core/common/api_result.dart';
import '../../data/models/store_info_request.dart';

abstract class StoreInfoRepo{

  Future<Result<StoreInfoEntity?>>getStoreInfo();
  Future<Result<StoreInfoEditEntity?>>editStoreInfo(StoreInfoRequest? storeInfoRequest);
  Future<Result<UploadImageStoreEntity?>> uploadImageStore(File imageFile,String imagePath);

}