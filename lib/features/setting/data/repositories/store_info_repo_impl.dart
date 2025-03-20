




import 'dart:io';

import 'package:dashboard_market/core/common/api_result.dart';
import 'package:dashboard_market/features/setting/data/data_sources/store_data_sources.dart';
import 'package:dashboard_market/features/setting/data/models/store_info_request.dart';
import 'package:dashboard_market/features/setting/domain/entities/store_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/store_info_repo.dart';
@Injectable(as: StoreInfoRepo)
class StoreInfoRepoImpl implements StoreInfoRepo {
  StoreDataSources storeDataSources;

  StoreInfoRepoImpl({required this.storeDataSources});
  @override
  Future<Result<StoreInfoEntity?>> getStoreInfo() {
 return storeDataSources.getStoreInfo();
  }

  @override
  Future<Result<StoreInfoEditEntity?>> editStoreInfo(StoreInfoRequest? storeInfoRequest) {
    return storeDataSources.editStoreInfo(storeInfoRequest);
  }

  @override
  Future<Result<UploadImageStoreEntity?>> uploadImageStore(File imageFile, String categoryName) {
   return storeDataSources.uploadImageStore(imageFile, categoryName);
  }

}