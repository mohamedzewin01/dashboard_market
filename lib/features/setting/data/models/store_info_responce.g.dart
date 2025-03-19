// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_info_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreInfoResponse _$StoreInfoResponseFromJson(Map<String, dynamic> json) =>
    StoreInfoResponse(
      status: json['status'] as String?,
      store: json['store'] == null
          ? null
          : Store.fromJson(json['store'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StoreInfoResponseToJson(StoreInfoResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'store': instance.store,
    };

Store _$StoreFromJson(Map<String, dynamic> json) => Store(
      storeId: (json['store_id'] as num?)?.toInt(),
      storeName: json['store_name'] as String?,
      storeDescreption: json['store_descreption'] as String?,
      storeImage: json['store_image'] as String?,
      storeDiscountTitle: json['store_discount_title'] as String?,
    );

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
      'store_id': instance.storeId,
      'store_name': instance.storeName,
      'store_descreption': instance.storeDescreption,
      'store_image': instance.storeImage,
      'store_discount_title': instance.storeDiscountTitle,
    };
