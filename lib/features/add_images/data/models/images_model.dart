import '../../domain/entities/images_entity.dart';

class ImagesModel {
  ImagesModel({
    this.status,
    this.images,
  });

  ImagesModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images?.add(Images.fromJson(v));
      });
    }
  }

  String? status;
  List<Images>? images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (images != null) {
      map['images'] = images?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  ImagesEntity toImagesEntity() {
    return ImagesEntity(status: status, images: images);
  }
}

class Images {
  Images({
    this.idImage,
    this.imagePath,
    this.imageName,
    this.imageCategory,
  });

  Images.fromJson(dynamic json) {
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
