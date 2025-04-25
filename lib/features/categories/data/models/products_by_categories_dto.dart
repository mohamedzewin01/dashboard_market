import 'package:dashboard_market/features/categories/domain/entities/fetch_categories.dart';
import 'package:dashboard_market/features/products/data/models/response/AllProductsRespose.dart';
import 'package:json_annotation/json_annotation.dart';

part 'products_by_categories_dto.g.dart';

@JsonSerializable()
class ProductsByCategoriesDto {
  @JsonKey(name: "productsData")
  final ProductsData? productsData;

  ProductsByCategoriesDto ({
    this.productsData,
  });

  factory ProductsByCategoriesDto.fromJson(Map<String, dynamic> json) {
    return _$ProductsByCategoriesDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductsByCategoriesDtoToJson(this);
  }
  ProductsByCategoriesEntity toProductsByCategoriesEntity() {
    return ProductsByCategoriesEntity(
      productsData: productsData,
    );
  }
}

@JsonSerializable()
class ProductsData {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "productsRelations")
  final List<ProductsRelations>? productsRelations;

  ProductsData ({
    this.status,
    this.productsRelations,
  });

  factory ProductsData.fromJson(Map<String, dynamic> json) {
    return _$ProductsDataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductsDataToJson(this);
  }
}

@JsonSerializable()
class ProductsRelations {
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
  @JsonKey(name: "category_id")
  final int? categoryId;
  @JsonKey(name: "category_name")
  final String? categoryName;
  @JsonKey(name: "category_image")
  final String? categoryImage;
  @JsonKey(name: "category_status")
  final int? categoryStatus;
  @JsonKey(name: "category_creatAt")
  final String? categoryCreatAt;

  ProductsRelations ({
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
    this.categoryId,
    this.categoryName,
    this.categoryImage,
    this.categoryStatus,
    this.categoryCreatAt,
  });

  factory ProductsRelations.fromJson(Map<String, dynamic> json) {
    return _$ProductsRelationsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductsRelationsToJson(this);
  }
  Products toProducts() {
    return Products(
      idProduct: idProduct,
      productName: productName,
      productPrice: productPrice,
      description: description,
      imageCover: imageCover,
      productPriceAfterDiscount: productPriceAfterDiscount,
      category: category,
      descount: descount,
      status: status,
      dateDescount: dateDescount,
      createdAt: createdAt,
    );
  }
}


