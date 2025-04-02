import 'package:dashboard_market/core/api/api_extentions.dart';
import 'package:dashboard_market/core/api/api_manager/api_manager.dart';
import 'package:dashboard_market/core/common/api_result.dart';
import 'package:dashboard_market/features/banners/domain/entities/banners_entity.dart';
import 'package:injectable/injectable.dart';



@injectable
class BannersDataSource {
  final ApiService apiService;

  BannersDataSource(this.apiService);

  Future<Result<BannersEntity?>> fetchBannersData() {
    return executeApi(
      () async {
        var response = await apiService.fetchBanners();
        return response?.toBannersEntity();
      },
    );
  }
}
