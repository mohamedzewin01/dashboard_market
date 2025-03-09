class EditProductRequest {
  EditProductRequest({
    required this.idProduct, // جعل idProduct required
    this.status,
    this.productName,
    this.description,
    this.imageCover,
    this.productPriceAfterDiscount,
    this.descount,
    this.dateDescount,
    this.category,
  }) {
    // التأكد من أن idProduct غير فارغ
    if (idProduct == null) {
      throw ArgumentError('idProduct is required');
    }
  }

  EditProductRequest.fromJson(dynamic json) {
    idProduct = json['id_product'];
    status = json['status'];
    productName = json['product_name'];
    description = json['description'];
    imageCover = json['image_cover'];
    productPriceAfterDiscount = json['product_price_after_discount'];
    descount = json['descount'];
    dateDescount = json['date_descount'];
    category = json['category'];

    if (idProduct == null) {
      throw ArgumentError('idProduct is required');
    }
  }

  num? idProduct;
  num? status;
  String? productName;
  String? description;
  String? imageCover;
  String? productPriceAfterDiscount;
  String? descount;
  String? dateDescount;
  String? category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (idProduct == null) {
      throw ArgumentError('idProduct is required');
    }
    map['id_product'] = idProduct;
    if (status != null) map['status'] = status;
    if (productName != null) map['product_name'] = productName;
    if (description != null) map['description'] = description;
    if (imageCover != null) map['image_cover'] = imageCover;
    if (productPriceAfterDiscount != null) {
      map['product_price_after_discount'] = productPriceAfterDiscount;
    }
    if (descount != null) map['descount'] = descount;
    if (dateDescount != null) map['date_descount'] = dateDescount;
    if (category != null) map['category'] = category;
    return map;
  }
}
