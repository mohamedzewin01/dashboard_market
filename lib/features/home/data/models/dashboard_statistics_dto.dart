import 'package:dashboard_market/features/home/domain/entities/home_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dashboard_statistics_dto.g.dart';

@JsonSerializable()
class DashboardStatisticsDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "dashboardStatistics")
  final List<DashboardStatistics>? dashboardStatistics;
  @JsonKey(name: "categoriesProductsCount")
  final List<CategoriesProductsCount>? categoriesProductsCount;

  DashboardStatisticsDto ({
    this.status,
    this.dashboardStatistics,
    this.categoriesProductsCount,
  });

  factory DashboardStatisticsDto.fromJson(Map<String, dynamic> json) {
    return _$DashboardStatisticsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DashboardStatisticsDtoToJson(this);
  }
  HomeEntity toDashboardStatisticsDto() => HomeEntity(
    status: status,
    dashboardStatistics: dashboardStatistics,
    categoriesProductsCount: categoriesProductsCount
  );
}

@JsonSerializable()
class DashboardStatistics {
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "subtitle")
  final String? subtitle;
  @JsonKey(name: "icon")
  final String? icon;
  @JsonKey(name: "iconBackgroundColor")
  final String? iconBackgroundColor;
  @JsonKey(name: "iconColor")
  final String? iconColor;
  @JsonKey(name: "value")
  final int? value;

  DashboardStatistics ({
    this.title,
    this.subtitle,
    this.icon,
    this.iconBackgroundColor,
    this.iconColor,
    this.value,
  });

  factory DashboardStatistics.fromJson(Map<String, dynamic> json) {
    return _$DashboardStatisticsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DashboardStatisticsToJson(this);
  }
}

@JsonSerializable()
class CategoriesProductsCount {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "total_products")
  final int? totalProducts;

  CategoriesProductsCount ({
    this.name,
    this.image,
    this.totalProducts,
  });

  factory CategoriesProductsCount.fromJson(Map<String, dynamic> json) {
    return _$CategoriesProductsCountFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CategoriesProductsCountToJson(this);
  }
}


