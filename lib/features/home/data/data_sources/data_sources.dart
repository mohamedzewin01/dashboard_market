


import 'package:dashboard_market/core/api/api_extentions.dart';
import 'package:dashboard_market/core/api/api_manager/api_manager.dart';
import 'package:dashboard_market/core/common/api_result.dart';
import 'package:dashboard_market/features/home/domain/entities/home_entity.dart';
import 'package:injectable/injectable.dart';


@injectable
class DataSourcesDashboardStatistics {
  final ApiService apiService;

  DataSourcesDashboardStatistics(this.apiService);


  Future<Result<HomeEntity?>> getDashboardStatistics()async {
    return executeApi(
      ()async{
        var response = await apiService.getDashboardStatistics();
        return response?.toDashboardStatisticsDto();
      }
    );
  }


}