// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product_responces.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProductResponse _$AddProductResponseFromJson(Map<String, dynamic> json) =>
    AddProductResponse(
      status: json['status'] as String?,
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddProductResponseToJson(AddProductResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'product': instance.product,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      idProduct: (json['id_product'] as num?)?.toInt(),
      productName: json['product_name'] as String?,
      productPrice: (json['product_price'] as num?)?.toInt(),
      description: json['description'] as String?,
      imageCover: json['image_cover'] as String?,
      productPriceAfterDiscount:
          (json['product_price_after_discount'] as num?)?.toInt(),
      category: (json['category'] as num?)?.toInt(),
      descount: (json['descount'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
      dateDescount: json['date_descount'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id_product': instance.idProduct,
      'product_name': instance.productName,
      'product_price': instance.productPrice,
      'description': instance.description,
      'image_cover': instance.imageCover,
      'product_price_after_discount': instance.productPriceAfterDiscount,
      'category': instance.category,
      'descount': instance.descount,
      'status': instance.status,
      'date_descount': instance.dateDescount,
      'createdAt': instance.createdAt,
    };
