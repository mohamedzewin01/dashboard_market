



import 'package:dashboard_market/core/common/api_result.dart';
import 'package:dashboard_market/features/home/data/data_sources/data_sources.dart';
import 'package:dashboard_market/features/home/domain/entities/home_entity.dart';
import 'package:dashboard_market/features/home/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo{
  final DataSourcesDashboardStatistics dataSourcesDashboardStatistics;

  HomeRepoImpl(this.dataSourcesDashboardStatistics);

  @override
  Future<Result<HomeEntity?>> getDashboardStatistics() {
    return dataSourcesDashboardStatistics.getDashboardStatistics();
  }




}