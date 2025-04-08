// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_info_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreInfoRequest _$StoreInfoRequestFromJson(Map<String, dynamic> json) =>
    StoreInfoRequest(
      storeId: (json['store_id'] as num?)?.toInt(),
      storeName: json['store_name'] as String?,
      storeDescreption: json['store_descreption'] as String?,
      storeDiscountTitle: json['store_discount_title'] as String?,
    );

Map<String, dynamic> _$StoreInfoRequestToJson(StoreInfoRequest instance) =>
    <String, dynamic>{
      'store_id': instance.storeId,
      'store_name': instance.storeName,
      'store_descreption': instance.storeDescreption,
      'store_discount_title': instance.storeDiscountTitle,
    };
