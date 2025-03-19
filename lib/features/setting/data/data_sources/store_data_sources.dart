


import 'package:dashboard_market/core/api/api_manager/api_manager.dart';
import 'package:dashboard_market/features/setting/domain/entities/store_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_extentions.dart';
import '../../../../core/common/api_result.dart';
@injectable
class StoreDataSources{
  ApiService apiService;

  StoreDataSources(this.apiService);


  Future<Result<StoreInfoEntity?>> getStoreInfo()async {
    return executeApi(
      ()async{
        var response = await apiService.getStoreInfo();
        return response?.toStoreInfoEntity();
      }
    );
  }

}