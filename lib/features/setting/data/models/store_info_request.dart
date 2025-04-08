import 'package:json_annotation/json_annotation.dart';

part 'store_info_request.g.dart';

@JsonSerializable()
class StoreInfoRequest {
  @JsonKey(name: "store_id")
  final int? storeId;
  @JsonKey(name: "store_name")
  final String? storeName;
  @JsonKey(name: "store_descreption")
  final String? storeDescreption;
  @JsonKey(name: "store_discount_title")
  final String? storeDiscountTitle;

  StoreInfoRequest ({
    this.storeId,
    this.storeName,
    this.storeDescreption,
    this.storeDiscountTitle,
  });

  factory StoreInfoRequest.fromJson(Map<String, dynamic> json) {
    return _$StoreInfoRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$StoreInfoRequestToJson(this);
  }
}


