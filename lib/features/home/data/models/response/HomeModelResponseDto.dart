import '../../../domain/entities/home_entities.dart';

class HomeModelResponseDto {
  HomeModelResponseDto({
    this.status,
    this.data,
  });

  HomeModelResponseDto.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  String? status;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

  HomeEntity toHomeEntity() {
    return HomeEntity(
      status: status,
      data: data,
    );
  }
}

class Data {
  Data({
    this.status,
    this.zone,
    this.category,
    this.bestDeals,
  });

  Data.fromJson(dynamic json) {
    status = json['status'];
    zone = json['zone'] != null ? Zone.fromJson(json['zone']) : null;
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    bestDeals = json['bestDeals'] != null
        ? BestDeals.fromJson(json['bestDeals'])
        : null;
  }

  String? status;
  Zone? zone;
  Category? category;
  BestDeals? bestDeals;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (zone != null) {
      map['zone'] = zone?.toJson();
    }
    if (category != null) {
      map['category'] = category?.toJson();
    }
    if (bestDeals != null) {
      map['bestDeals'] = bestDeals?.toJson();
    }
    return map;
  }
}

class BestDeals {
  BestDeals({
    this.status,
    this.products,
  });

  BestDeals.fromJson(dynamic json) {
    status = json['status'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
  }

  String? status;
  List<Products>? products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Products {
  Products({
    this.idProduct,
    this.nameProduct,
    this.nameProductAr,
    this.imageProduct,
    this.description,
    this.descriptionAr,
    this.priceOld,
    this.priceNew,
    this.qunantity,
    this.discount,
    this.status,
    this.createdAt,
    this.productsCategoryId,
    this.productsZoneId,
    this.idCategory,
    this.nameCategory,
    this.imageCategory,
    this.categoryStatus,
    this.zoneCategory,
    this.zoneId,
    this.zoneName,
    this.zoneImage,
    this.zoneStatus,
  });

  Products.fromJson(dynamic json) {
    idProduct = json['id_product'];
    nameProduct = json['name_product'];
    nameProductAr = json['name_product_ar'];
    imageProduct = json['image_product'];
    description = json['description'];
    descriptionAr = json['description_ar'];
    priceOld = json['price_old'];
    priceNew = json['price_new'];
    qunantity = json['qunantity'];
    discount = json['discount'];
    status = json['status'];
    createdAt = json['createdAt'];
    productsCategoryId = json['products_category_id'];
    productsZoneId = json['products_zone_id'];
    idCategory = json['id_category'];
    nameCategory = json['name_category'];
    imageCategory = json['image_category'];
    categoryStatus = json['category_status'];
    zoneCategory = json['zone_category'];
    zoneId = json['zone_id'];
    zoneName = json['zone_name'];
    zoneImage = json['zone_image'];
    zoneStatus = json['zone_status'];
  }

  num? idProduct;
  String? nameProduct;
  String? nameProductAr;
  String? imageProduct;
  String? description;
  String? descriptionAr;
  num? priceOld;
  num? priceNew;
  num? qunantity;
  num? discount;
  num? status;
  String? createdAt;
  num? productsCategoryId;
  num? productsZoneId;
  num? idCategory;
  String? nameCategory;
  String? imageCategory;
  num? categoryStatus;
  num? zoneCategory;
  num? zoneId;
  String? zoneName;
  String? zoneImage;
  num? zoneStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_product'] = idProduct;
    map['name_product'] = nameProduct;
    map['name_product_ar'] = nameProductAr;
    map['image_product'] = imageProduct;
    map['description'] = description;
    map['description_ar'] = descriptionAr;
    map['price_old'] = priceOld;
    map['price_new'] = priceNew;
    map['qunantity'] = qunantity;
    map['discount'] = discount;
    map['status'] = status;
    map['createdAt'] = createdAt;
    map['products_category_id'] = productsCategoryId;
    map['products_zone_id'] = productsZoneId;
    map['id_category'] = idCategory;
    map['name_category'] = nameCategory;
    map['image_category'] = imageCategory;
    map['category_status'] = categoryStatus;
    map['zone_category'] = zoneCategory;
    map['zone_id'] = zoneId;
    map['zone_name'] = zoneName;
    map['zone_image'] = zoneImage;
    map['zone_status'] = zoneStatus;
    return map;
  }
}

class Category {
  Category({
    this.status,
    this.categories,
  });

  Category.fromJson(dynamic json) {
    status = json['status'];
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
  }

  String? status;
  List<Categories>? categories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (categories != null) {
      map['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Categories {
  Categories({
    this.idCategory,
    this.nameCategory,
    this.nameCategoryAr,
    this.imageCategory,
    this.categoryStatus,
    this.zoneCategory,
  });

  Categories.fromJson(dynamic json) {
    idCategory = json['id_category'];
    nameCategory = json['name_category'];
    nameCategoryAr = json['name_category_ar'];
    imageCategory = json['image_category'];
    categoryStatus = json['category_status'];
    zoneCategory = json['zone_category'];
  }

  num? idCategory;
  String? nameCategory;
  String? nameCategoryAr;
  String? imageCategory;
  num? categoryStatus;
  num? zoneCategory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_category'] = idCategory;
    map['name_category'] = nameCategory;
    map['name_category_ar'] = nameCategoryAr;
    map['image_category'] = imageCategory;
    map['category_status'] = categoryStatus;
    map['zone_category'] = zoneCategory;
    return map;
  }
}

class Zone {
  Zone({
    this.zoneId,
    this.zoneName,
    this.zoneNameAr,
    this.zoneImage,
    this.zoneStatus,
  });

  Zone.fromJson(dynamic json) {
    zoneId = json['zone_id'];
    zoneName = json['zone_name'];
    zoneNameAr = json['zone_name_ar'];
    zoneImage = json['zone_image'];
    zoneStatus = json['zone_status'];
  }

  num? zoneId;
  String? zoneName;
  String? zoneNameAr;
  String? zoneImage;
  num? zoneStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['zone_id'] = zoneId;
    map['zone_name'] = zoneName;
    map['zone_name_ar'] = zoneNameAr;
    map['zone_image'] = zoneImage;
    map['zone_status'] = zoneStatus;
    return map;
  }
}
