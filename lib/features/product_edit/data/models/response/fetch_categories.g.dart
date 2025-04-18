// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchCategoriesEdit _$FetchCategoriesEditFromJson(Map<String, dynamic> json) =>
    FetchCategoriesEdit(
      status: json['status'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoriesEdit.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FetchCategoriesEditToJson(
        FetchCategoriesEdit instance) =>
    <String, dynamic>{
      'status': instance.status,
      'categories': instance.categories,
    };

CategoriesEdit _$CategoriesEditFromJson(Map<String, dynamic> json) =>
    CategoriesEdit(
      categoryId: (json['category_id'] as num?)?.toInt(),
      categoryName: json['category_name'] as String?,
      categoryImage: json['category_image'] as String?,
      categoryStatus: (json['category_status'] as num?)?.toInt(),
      categoryCreatAt: json['category_creatAt'] as String?,
    );

Map<String, dynamic> _$CategoriesEditToJson(CategoriesEdit instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'category_image': instance.categoryImage,
      'category_status': instance.categoryStatus,
      'category_creatAt': instance.categoryCreatAt,
    };
