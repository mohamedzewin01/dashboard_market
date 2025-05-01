import 'package:dashboard_market/features/add_product/domain/entities/add_product_entity.dart';

class UpLoadImageProductModel {
  UpLoadImageProductModel({
    this.status,
    this.image,
  });

  UpLoadImageProductModel.fromJson(dynamic json) {
    status = json['status'];
    image = json['Image'] != null ? ImageProduct.fromJson(json['Image']) : null;
  }

  String? status;
  ImageProduct? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (image != null) {
      map['Image'] = image?.toJson();
    }
    return map;
  }

  UpLoadImageProductEntity toUpLoadImageProductEntity() =>
      UpLoadImageProductEntity(status: status, image: image);
}

class ImageProduct {
  ImageProduct({
    this.idImage,
    this.imagePath,
    this.imageName,
    this.imageCategory,
  });

  ImageProduct.fromJson(dynamic json) {
    idImage = json['id_image'];
    imagePath = json['image_path'];
    imageName = json['image_name'];
    imageCategory = json['image_category'];
  }

  num? idImage;
  String? imagePath;
  String? imageName;
  String? imageCategory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_image'] = idImage;
    map['image_path'] = imagePath;
    map['image_name'] = imageName;
    map['image_category'] = imageCategory;
    return map;
  }
}
