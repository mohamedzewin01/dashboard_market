// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteImage _$DeleteImageFromJson(Map<String, dynamic> json) => DeleteImage(
      status: json['status'] as String?,
      deletedData: json['deleted_data'] == null
          ? null
          : DeletedData.fromJson(json['deleted_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeleteImageToJson(DeleteImage instance) =>
    <String, dynamic>{
      'status': instance.status,
      'deleted_data': instance.deletedData,
    };

DeletedData _$DeletedDataFromJson(Map<String, dynamic> json) => DeletedData(
      idImage: (json['id_image'] as num?)?.toInt(),
      imagePath: json['image_path'] as String?,
      imageName: json['image_name'] as String?,
      imageCategory: json['image_category'] as String?,
    );

Map<String, dynamic> _$DeletedDataToJson(DeletedData instance) =>
    <String, dynamic>{
      'id_image': instance.idImage,
      'image_path': instance.imagePath,
      'image_name': instance.imageName,
      'image_category': instance.imageCategory,
    };
