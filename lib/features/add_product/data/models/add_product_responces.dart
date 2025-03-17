import 'package:dashboard_market/features/add_product/domain/entities/add_product_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_product_responces.g.dart';

@JsonSerializable()
class AddProductResponse {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "product")
  final Product? product;

  AddProductResponse ({
    this.status,
    this.product,
  });

  factory AddProductResponse.fromJson(Map<String, dynamic> json) {
    return _$AddProductResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddProductResponseToJson(this);
  }

  AddProductEntity toAddProductEntity() {
    return AddProductEntity(
      status: status,
      product: product,
    );
  }
}

@JsonSerializable()
class Product {
  @JsonKey(name: "id_product")
  final int? idProduct;
  @JsonKey(name: "product_name")
  final String? productName;
  @JsonKey(name: "product_price")
  final int? productPrice;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "image_cover")
  final String? imageCover;
  @JsonKey(name: "product_price_after_discount")
  final int? productPriceAfterDiscount;
  @JsonKey(name: "category")
  final int? category;
  @JsonKey(name: "descount")
  final int? descount;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "date_descount")
  final String? dateDescount;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  Product ({
    this.idProduct,
    this.productName,
    this.productPrice,
    this.description,
    this.imageCover,
    this.productPriceAfterDiscount,
    this.category,
    this.descount,
    this.status,
    this.dateDescount,
    this.createdAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductToJson(this);
  }
}


