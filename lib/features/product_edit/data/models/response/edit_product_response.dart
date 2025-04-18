import '../../../domain/entities/edit_product_entity.dart';

class EditProductResponseDto {
  EditProductResponseDto({
    this.message,
  });

  EditProductResponseDto.fromJson(dynamic json) {
    message = json['message'];
  }

  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    return map;
  }

  EditProductModelEntity toEditProductEntity() =>
      EditProductModelEntity(message: message);
}
