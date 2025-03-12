import '../../domain/entities/image_upload_entity.dart';

class UpLoadImageModel {
  UpLoadImageModel({
      this.status, 
      this.image,});

  UpLoadImageModel.fromJson(dynamic json) {
    status = json['status'];
    image = json['Image'] != null ? Image.fromJson(json['Image']) : null;
  }
  String? status;
  Image? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (image != null) {
      map['Image'] = image?.toJson();
    }
    return map;
  }
  UpLoadImageEntity toUpLoadImageEntity() => UpLoadImageEntity(status: status, image: image);
}

class Image {
  Image({
      this.idImage, 
      this.imagePath, 
      this.imageName, 
      this.imageCategory,});

  Image.fromJson(dynamic json) {
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