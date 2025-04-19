import 'package:dashboard_market/features/add_product/domain/entities/add_product_entity.dart';



class ImagesDto {
  ImagesDto({
    this.status,
    this.images,
  });

  ImagesDto.fromJson(dynamic json) {
    status = json['status'];
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images?.add(AllImages.fromJson(v));
      });
    }
  }

  String? status;
  List<AllImages>? images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (images != null) {
      map['images'] = images?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  AllImagesEntity toAllImagesEntity() {
    return AllImagesEntity(status: status, images: images);
  }
}

class AllImages {
  AllImages({
    this.idImage,
    this.imagePath,
    this.imageName,
    this.imageCategory,
  });

  AllImages.fromJson(dynamic json) {
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
