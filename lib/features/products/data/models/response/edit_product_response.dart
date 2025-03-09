import '../../../domain/entities/edit_product_entity.dart';

class EditProductResponse {
  EditProductResponse({
    this.message,
  });

  EditProductResponse.fromJson(dynamic json) {
    message = json['message'];
  }

  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    return map;
  }

  EditProductEntity toEditProductEntity() =>
      EditProductEntity(message: message);
}
