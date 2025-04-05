import 'package:dashboard_market/features/banners/domain/entities/banners_entity.dart';

class AddBannerModel {
  AddBannerModel({
      this.status, 
      this.newBanner,});

  AddBannerModel.fromJson(dynamic json) {
    status = json['status'];
    newBanner = json['new_banner'] != null ? NewBanner.fromJson(json['new_banner']) : null;
  }
  String? status;
  NewBanner? newBanner;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (newBanner != null) {
      map['new_banner'] = newBanner?.toJson();
    }
    return map;
  }
  AddBannersEntity toAddBannersEntity() => AddBannersEntity(status: status, newBanner: newBanner);
}

class NewBanner {
  NewBanner({
      this.bannersId, 
      this.bannersUrlImage, 
      this.bannersTitle, 
      this.bannersDescription, 
      this.bannersProductId, 
      this.bannersStatus, 
      this.bannersCreatedAt,});

  NewBanner.fromJson(dynamic json) {
    bannersId = json['banners_id'];
    bannersUrlImage = json['banners_url_image'];
    bannersTitle = json['banners_title'];
    bannersDescription = json['banners_description'];
    bannersProductId = json['banners_productId'];
    bannersStatus = json['banners_status'];
    bannersCreatedAt = json['banners_created_at'];
  }
  num? bannersId;
  String? bannersUrlImage;
  String? bannersTitle;
  String? bannersDescription;
  num? bannersProductId;
  num? bannersStatus;
  String? bannersCreatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['banners_id'] = bannersId;
    map['banners_url_image'] = bannersUrlImage;
    map['banners_title'] = bannersTitle;
    map['banners_description'] = bannersDescription;
    map['banners_productId'] = bannersProductId;
    map['banners_status'] = bannersStatus;
    map['banners_created_at'] = bannersCreatedAt;
    return map;
  }

}