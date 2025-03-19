


import 'package:dashboard_market/features/setting/domain/entities/store_entity.dart';

import '../../../../core/common/api_result.dart';

abstract class StoreInfoRepo{

  Future<Result<StoreInfoEntity?>>getStoreInfo();

}