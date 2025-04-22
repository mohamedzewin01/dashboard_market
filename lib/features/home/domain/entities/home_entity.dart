import 'package:dashboard_market/features/home/data/models/dashboard_statistics_dto.dart';


class HomeEntity {

  final String? status;

  final List<DashboardStatistics>? dashboardStatistics;

  final List<CategoriesProductsCount>? categoriesProductsCount;

  HomeEntity ({
    this.status,
    this.dashboardStatistics,
    this.categoriesProductsCount,
  });


}