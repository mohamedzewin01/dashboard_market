// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_statistics_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardStatisticsDto _$DashboardStatisticsDtoFromJson(
        Map<String, dynamic> json) =>
    DashboardStatisticsDto(
      status: json['status'] as String?,
      dashboardStatistics: (json['dashboardStatistics'] as List<dynamic>?)
          ?.map((e) => DashboardStatistics.fromJson(e as Map<String, dynamic>))
          .toList(),
      categoriesProductsCount:
          (json['categoriesProductsCount'] as List<dynamic>?)
              ?.map((e) =>
                  CategoriesProductsCount.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$DashboardStatisticsDtoToJson(
        DashboardStatisticsDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'dashboardStatistics': instance.dashboardStatistics,
      'categoriesProductsCount': instance.categoriesProductsCount,
    };

DashboardStatistics _$DashboardStatisticsFromJson(Map<String, dynamic> json) =>
    DashboardStatistics(
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      icon: json['icon'] as String?,
      iconBackgroundColor: json['iconBackgroundColor'] as String?,
      iconColor: json['iconColor'] as String?,
      value: (json['value'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DashboardStatisticsToJson(
        DashboardStatistics instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'icon': instance.icon,
      'iconBackgroundColor': instance.iconBackgroundColor,
      'iconColor': instance.iconColor,
      'value': instance.value,
    };

CategoriesProductsCount _$CategoriesProductsCountFromJson(
        Map<String, dynamic> json) =>
    CategoriesProductsCount(
      name: json['name'] as String?,
      image: json['image'] as String?,
      totalProducts: (json['total_products'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CategoriesProductsCountToJson(
        CategoriesProductsCount instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'total_products': instance.totalProducts,
    };
