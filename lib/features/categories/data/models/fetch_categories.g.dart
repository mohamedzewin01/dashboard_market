// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchCategoriesResponse _$FetchCategoriesResponseFromJson(
        Map<String, dynamic> json) =>
    FetchCategoriesResponse(
      status: json['status'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Categories.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FetchCategoriesResponseToJson(
        FetchCategoriesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'categories': instance.categories,
    };

Categories _$CategoriesFromJson(Map<String, dynamic> json) => Categories(
      categoryId: (json['category_id'] as num?)?.toInt(),
      categoryName: json['category_name'] as String?,
      categoryImage: json['category_image'] as String?,
      categoryStatus: (json['category_status'] as num?)?.toInt(),
      categoryCreatAt: json['category_creatAt'] as String?,
    );

Map<String, dynamic> _$CategoriesToJson(Categories instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'category_image': instance.categoryImage,
      'category_status': instance.categoryStatus,
      'category_creatAt': instance.categoryCreatAt,
    };
