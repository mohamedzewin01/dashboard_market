

import 'package:dashboard_market/core/common/api_result.dart';
import 'package:dashboard_market/features/banners/domain/entities/banners_entity.dart';

abstract class BannersRepo {
  Future<Result<BannersEntity?>>fetchBannersData();

}