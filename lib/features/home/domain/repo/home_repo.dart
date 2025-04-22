



import 'package:dashboard_market/core/common/api_result.dart';
import 'package:dashboard_market/features/home/domain/entities/home_entity.dart';

abstract class HomeRepo {
  Future<Result<HomeEntity?>> getDashboardStatistics();
}