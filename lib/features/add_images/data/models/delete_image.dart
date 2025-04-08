import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/delete_image_entity.dart';

part 'delete_image.g.dart';

@JsonSerializable()
class DeleteImage {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "deleted_data")
  final DeletedData? deletedData;

  DeleteImage ({
    this.status,
    this.deletedData,
  });

  factory DeleteImage.fromJson(Map<String, dynamic> json) {
    return _$DeleteImageFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DeleteImageToJson(this);
  }
  DeleteImageEntity toDeleteImageEntity() =>
      DeleteImageEntity(status);
}

@JsonSerializable()
class DeletedData {
  @JsonKey(name: "id_image")
  final int? idImage;
  @JsonKey(name: "image_path")
  final String? imagePath;
  @JsonKey(name: "image_name")
  final String? imageName;
  @JsonKey(name: "image_category")
  final String? imageCategory;

  DeletedData ({
    this.idImage,
    this.imagePath,
    this.imageName,
    this.imageCategory,
  });

  factory DeletedData.fromJson(Map<String, dynamic> json) {
    return _$DeletedDataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DeletedDataToJson(this);
  }
}


