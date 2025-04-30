


import 'dart:io';

import 'package:dashboard_market/core/api/api_manager/api_manager.dart';
import 'package:dashboard_market/features/setting/domain/entities/store_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_extentions.dart';
import '../../../../core/common/api_result.dart';
import '../models/store_info_request.dart';


@injectable
class StoreDataSources{
  ApiService apiService;

  StoreDataSources(this.apiService);


  Future<Result<StoreInfoEntity?>> getStoreInfo()async {
    return executeApi(
      ()async{
        final response = await apiService.getStoreInfo();
        return response?.toStoreInfoEntity();
      }
    );
  }
  Future<Result<StoreInfoEditEntity?>> editStoreInfo(StoreInfoRequest? storeInfoRequest)async {
    return executeApi(
      ()async{
        final response = await apiService.editStoreInfo(storeInfoRequest);
        return response?.toStoreInfoEditEntity();
      }
    );
  }
  Future<Result<UploadImageStoreEntity?>> uploadImageStore(File imageFile,String imagePath)async {
    return executeApi(
            ()async{
          final response = await apiService.uploadImageStore(imageFile, imagePath);
          return response?.toUploadImageStoreEntity();
        }
    );
  }
}