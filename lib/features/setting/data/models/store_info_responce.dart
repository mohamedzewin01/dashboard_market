import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/store_entity.dart';

part 'store_info_responce.g.dart';

@JsonSerializable()
class StoreInfoResponse {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "store")
  final Store? store;

  StoreInfoResponse ({
    this.status,
    this.store,
  });

  factory StoreInfoResponse.fromJson(Map<String, dynamic> json) {
    return _$StoreInfoResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$StoreInfoResponseToJson(this);
  }
  StoreInfoEntity toStoreInfoEntity() => StoreInfoEntity(status: status, store: store);
}

@JsonSerializable()
class Store {
  @JsonKey(name: "store_id")
  final int? storeId;
  @JsonKey(name: "store_name")
  final String? storeName;
  @JsonKey(name: "store_descreption")
  final String? storeDescreption;
  @JsonKey(name: "store_image")
  final String? storeImage;
  @JsonKey(name: "store_discount_title")
  final String? storeDiscountTitle;

  Store ({
    this.storeId,
    this.storeName,
    this.storeDescreption,
    this.storeImage,
    this.storeDiscountTitle,
  });

  factory Store.fromJson(Map<String, dynamic> json) {
    return _$StoreFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$StoreToJson(this);
  }
}


