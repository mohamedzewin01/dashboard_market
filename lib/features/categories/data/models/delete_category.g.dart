// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteCategoryDto _$DeleteCategoryDtoFromJson(Map<String, dynamic> json) =>
    DeleteCategoryDto(
      status: json['status'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$DeleteCategoryDtoToJson(DeleteCategoryDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
