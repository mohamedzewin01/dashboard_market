// import 'package:grocery_app/features/home/domain/entities/home_entities.dart';
// import 'package:json_annotation/json_annotation.dart';
//
// part 'home_response.g.dart';
//
// @JsonSerializable()
// class HomeModelResponseDto {
//   @JsonKey(name: "status")
//   final String? status;
//   @JsonKey(name: "data")
//   final Data? data;
//
//   HomeModelResponseDto ({
//     this.status,
//     this.data,
//   });
//
//   factory HomeModelResponseDto.fromJson(Map<String, dynamic> json) {
//     return _$HomeModelResponseDtoFromJson(json);
//   }
//
//   Map<String, dynamic> toJson() {
//     return _$HomeModelResponseDtoToJson(this);
//   }
//   HomeEntity toHomeEntity(){
//     return HomeEntity(
//       status: status,
//       data: data,
//     );
//   }
// }
//
// @JsonSerializable()
// class Data {
//   @JsonKey(name: "status")
//   final String? status;
//   @JsonKey(name: "zone")
//   final Zone? zone;
//   @JsonKey(name: "category")
//   final Category? category;
//   @JsonKey(name: "bestDeals")
//   final BestDeals? bestDeals;
//
//   Data ({
//     this.status,
//     this.zone,
//     this.category,
//     this.bestDeals,
//   });
//
//   factory Data.fromJson(Map<String, dynamic> json) {
//     return _$DataFromJson(json);
//   }
//
//   Map<String, dynamic> toJson() {
//     return _$DataToJson(this);
//   }
// }
//
// @JsonSerializable()
// class Zone {
//   @JsonKey(name: "zone_id")
//   final int? zoneId;
//   @JsonKey(name: "zone_name")
//   final String? zoneName;
//   @JsonKey(name: "zone_name_ar")
//   final String? zoneNameAr;
//   @JsonKey(name: "zone_image")
//   final String? zoneImage;
//   @JsonKey(name: "zone_status")
//   final int? zoneStatus;
//
//   Zone ({
//     this.zoneId,
//     this.zoneName,
//     this.zoneNameAr,
//     this.zoneImage,
//     this.zoneStatus,
//   });
//
//   factory Zone.fromJson(Map<String, dynamic> json) {
//     return _$ZoneFromJson(json);
//   }
//
//   Map<String, dynamic> toJson() {
//     return _$ZoneToJson(this);
//   }
// }
//
// @JsonSerializable()
// class Category {
//   @JsonKey(name: "status")
//   final String? status;
//   @JsonKey(name: "categories")
//   final List<Categories>? categories;
//
//   Category ({
//     this.status,
//     this.categories,
//   });
//
//   factory Category.fromJson(Map<String, dynamic> json) {
//     return _$CategoryFromJson(json);
//   }
//
//   Map<String, dynamic> toJson() {
//     return _$CategoryToJson(this);
//   }
// }
//
// @JsonSerializable()
// class Categories {
//   @JsonKey(name: "id_category")
//   final int? idCategory;
//   @JsonKey(name: "name_category")
//   final String? nameCategory;
//   @JsonKey(name: "name_category_ar")
//   final String? nameCategoryAr;
//   @JsonKey(name: "image_category")
//   final String? imageCategory;
//   @JsonKey(name: "category_status")
//   final int? categoryStatus;
//   @JsonKey(name: "zone_category")
//   final int? zoneCategory;
//
//   Categories ({
//     this.idCategory,
//     this.nameCategory,
//     this.nameCategoryAr,
//     this.imageCategory,
//     this.categoryStatus,
//     this.zoneCategory,
//   });
//
//   factory Categories.fromJson(Map<String, dynamic> json) {
//     return _$CategoriesFromJson(json);
//   }
//
//   Map<String, dynamic> toJson() {
//     return _$CategoriesToJson(this);
//   }
// }
//
// @JsonSerializable()
// class BestDeals {
//   @JsonKey(name: "status")
//   final String? status;
//   @JsonKey(name: "products")
//   final List<Products>? products;
//
//   BestDeals ({
//     this.status,
//     this.products,
//   });
//
//   factory BestDeals.fromJson(Map<String, dynamic> json) {
//     return _$BestDealsFromJson(json);
//   }
//
//   Map<String, dynamic> toJson() {
//     return _$BestDealsToJson(this);
//   }
// }
//
// @JsonSerializable()
// class Products {
//   @JsonKey(name: "id_product")
//   final int? idProduct;
//   @JsonKey(name: "name_product")
//   final String? nameProduct;
//   @JsonKey(name: "name_product_ar")
//   final String? nameProductAr;
//   @JsonKey(name: "image_product")
//   final String? imageProduct;
//   @JsonKey(name: "description")
//   final String? description;
//   @JsonKey(name: "description_ar")
//   final String? descriptionAr;
//   @JsonKey(name: "price_old")
//   final int? priceOld;
//   @JsonKey(name: "price_new")
//   final int? priceNew;
//   @JsonKey(name: "qunantity")
//   final int? qunantity;
//   @JsonKey(name: "discount")
//   final int? discount;
//   @JsonKey(name: "status")
//   final int? status;
//   @JsonKey(name: "createdAt")
//   final String? createdAt;
//   @JsonKey(name: "products_category_id")
//   final int? productsCategoryId;
//   @JsonKey(name: "products_zone_id")
//   final int? productsZoneId;
//   @JsonKey(name: "id_category")
//   final int? idCategory;
//   @JsonKey(name: "name_category")
//   final String? nameCategory;
//   @JsonKey(name: "image_category")
//   final String? imageCategory;
//   @JsonKey(name: "category_status")
//   final int? categoryStatus;
//   @JsonKey(name: "zone_category")
//   final int? zoneCategory;
//   @JsonKey(name: "zone_id")
//   final int? zoneId;
//   @JsonKey(name: "zone_name")
//   final String? zoneName;
//   @JsonKey(name: "zone_image")
//   final String? zoneImage;
//   @JsonKey(name: "zone_status")
//   final int? zoneStatus;
//
//   Products ({
//     this.idProduct,
//     this.nameProduct,
//     this.nameProductAr,
//     this.imageProduct,
//     this.description,
//     this.descriptionAr,
//     this.priceOld,
//     this.priceNew,
//     this.qunantity,
//     this.discount,
//     this.status,
//     this.createdAt,
//     this.productsCategoryId,
//     this.productsZoneId,
//     this.idCategory,
//     this.nameCategory,
//     this.imageCategory,
//     this.categoryStatus,
//     this.zoneCategory,
//     this.zoneId,
//     this.zoneName,
//     this.zoneImage,
//     this.zoneStatus,
//   });
//
//   factory Products.fromJson(Map<String, dynamic> json) {
//     return _$ProductsFromJson(json);
//   }
//
//   Map<String, dynamic> toJson() {
//     return _$ProductsToJson(this);
//   }
// }
//
//
