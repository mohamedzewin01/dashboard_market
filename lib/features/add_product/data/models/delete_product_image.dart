import 'package:dashboard_market/features/add_product/domain/entities/add_product_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delete_product_image.g.dart';

@JsonSerializable()
class DeleteProductImage {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "deleted_data")
  final DeleteProductImage? deletedData;

  DeleteProductImage({
    this.status,
    this.deletedData,
  });

  factory DeleteProductImage.fromJson(Map<String, dynamic> json) {
    return _$DeleteProductImageFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DeleteProductImageToJson(this);
  }

  DeleteProductImageEntity toDeleteImageEntity() =>
      DeleteProductImageEntity(status: status, deletedData: deletedData);
}

@JsonSerializable()
class DeletedImageData {
  @JsonKey(name: "id_image")
  final int? idImage;
  @JsonKey(name: "image_path")
  final String? imagePath;
  @JsonKey(name: "image_name")
  final String? imageName;
  @JsonKey(name: "image_category")
  final String? imageCategory;

  DeletedImageData({
    this.idImage,
    this.imagePath,
    this.imageName,
    this.imageCategory,
  });

  factory DeletedImageData.fromJson(Map<String, dynamic> json) {
    return _$DeletedImageDataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DeletedImageDataToJson(this);
  }
}
