import 'package:dashboard_market/features/products/domain/entities/products_entities.dart';

class AllProductsResponse {
  AllProductsResponse({
      this.status, 
      this.products, 
      this.page, 
      this.limit, 
      this.total, 
      this.pages,}
      );

  AllProductsResponse.fromJson(dynamic json) {
    status = json['status'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
    page = json['page'];
    limit = json['limit'];
    total = json['total'];
    pages = json['pages'];
  }
  String? status;
  List<Products>? products;
  num? page;
  num? limit;
  num? total;
  num? pages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    map['page'] = page;
    map['limit'] = limit;
    map['total'] = total;
    map['pages'] = pages;
    return map;
  }
  ProductsEntity toHomeEntity() {
    return ProductsEntity(
      status: status,
      products: products,
      page: page,
      limit: limit,
      total: total,

    );
  }

}

class Products {
  Products({
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
      this.createdAt,});

  Products.fromJson(dynamic json) {
    idProduct = json['id_product'];
    productName = json['product_name'];
    productPrice = json['product_price'];
    description = json['description'];
    imageCover = json['image_cover'];
    productPriceAfterDiscount = json['product_price_after_discount'];
    category = json['category'];
    descount = json['descount'];
    status = json['status'];
    dateDescount = json['date_descount'];
    createdAt = json['createdAt'];
  }
  int? idProduct;
  String? productName;
  num? productPrice;
  String? description;
  String? imageCover;
  num? productPriceAfterDiscount;
  int? category;
  num? descount;
  num? status;
  String? dateDescount;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_product'] = idProduct;
    map['product_name'] = productName;
    map['product_price'] = productPrice;
    map['description'] = description;
    map['image_cover'] = imageCover;
    map['product_price_after_discount'] = productPriceAfterDiscount;
    map['category'] = category;
    map['descount'] = descount;
    map['status'] = status;
    map['date_descount'] = dateDescount;
    map['createdAt'] = createdAt;
    return map;
  }

}