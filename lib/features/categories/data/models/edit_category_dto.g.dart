// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditCategoryDto _$EditCategoryDtoFromJson(Map<String, dynamic> json) =>
    EditCategoryDto(
      status: json['status'] as String?,
      updated: json['updated'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EditCategoryDtoToJson(EditCategoryDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'updated': instance.updated,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      categoryId: (json['category_id'] as num?)?.toInt(),
      categoryName: json['category_name'] as String?,
      categoryImage: json['category_image'] as String?,
      categoryStatus: (json['category_status'] as num?)?.toInt(),
      categoryCreatAt: json['category_creatAt'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'category_image': instance.categoryImage,
      'category_status': instance.categoryStatus,
      'category_creatAt': instance.categoryCreatAt,
    };
