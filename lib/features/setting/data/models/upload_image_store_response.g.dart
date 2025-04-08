// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_image_store_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadImageStoreResponse _$UploadImageStoreResponseFromJson(
        Map<String, dynamic> json) =>
    UploadImageStoreResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$UploadImageStoreResponseToJson(
        UploadImageStoreResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
