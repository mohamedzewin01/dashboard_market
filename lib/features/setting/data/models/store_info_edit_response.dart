import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/store_entity.dart';

part 'store_info_edit_response.g.dart';

@JsonSerializable()
class StoreInfoEditResponse {
  @JsonKey(name: "message")
  final String? message;

  StoreInfoEditResponse ({
    this.message,
  });

  factory StoreInfoEditResponse.fromJson(Map<String, dynamic> json) {
    return _$StoreInfoEditResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$StoreInfoEditResponseToJson(this);
  }
  StoreInfoEditEntity toStoreInfoEditEntity() =>
      StoreInfoEditEntity(message: message);
}


