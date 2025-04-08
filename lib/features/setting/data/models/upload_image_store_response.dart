import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/store_entity.dart';

part 'upload_image_store_response.g.dart';

@JsonSerializable()
class UploadImageStoreResponse {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "message")
  final String? message;

  UploadImageStoreResponse ({
    this.status,
    this.message,
  });

  factory UploadImageStoreResponse.fromJson(Map<String, dynamic> json) {
    return _$UploadImageStoreResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UploadImageStoreResponseToJson(this);
  }
  UploadImageStoreEntity toUploadImageStoreEntity() {
    return UploadImageStoreEntity(
      status: status,
      message: message,
    );
  }
}


