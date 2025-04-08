import 'package:dashboard_market/features/banners/domain/entities/banners_entity.dart';

class BannersModelsResponse {
  BannersModelsResponse({
    this.status,
    this.banners,
  });

  BannersModelsResponse.fromJson(dynamic json) {
    status = json['status'];
    if (json['banners'] != null) {
      banners = [];
      json['banners'].forEach((v) {
        banners?.add(Banners.fromJson(v));
      });
    }
  }

  String? status;
  List<Banners>? banners;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (banners != null) {
      map['banners'] = banners?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  BannersEntity toBannersEntity() =>
      BannersEntity(status: status, banners: banners);
}

class Banners {
  Banners({
    this.bannersId,
    this.bannersUrlImage,
    this.bannersTitle,
    this.bannersDescription,
    this.bannersProductId,
    this.bannersStatus,
    this.bannersCreatedAt,
  });

  Banners.fromJson(dynamic json) {
    bannersId = json['banners_id'];
    bannersUrlImage = json['banners_url_image'];
    bannersTitle = json['banners_title'];
    bannersDescription = json['banners_description'];
    bannersProductId = json['banners_productId'];
    bannersStatus = json['banners_status'];
    bannersCreatedAt = json['banners_created_at'];
  }

  int? bannersId;
  String? bannersUrlImage;
  String? bannersTitle;
  String? bannersDescription;
  int? bannersProductId;
  int? bannersStatus;
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
