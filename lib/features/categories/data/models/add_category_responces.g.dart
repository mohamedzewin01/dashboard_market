// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_category_responces.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCategoryResponse _$AddCategoryResponseFromJson(Map<String, dynamic> json) =>
    AddCategoryResponse(
      status: json['status'] as String?,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddCategoryResponseToJson(
        AddCategoryResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'category': instance.category,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      categoryId: (json['category_id'] as num?)?.toInt(),
      categoryName: json['category_name'] as String?,
      categoryImage: json['category_image'] as String?,
      categoryStatus: (json['category_status'] as num?)?.toInt(),
      categoryCreatAt: json['category_creatAt'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'category_image': instance.categoryImage,
      'category_status': instance.categoryStatus,
      'category_creatAt': instance.categoryCreatAt,
    };
