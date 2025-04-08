import 'package:dashboard_market/features/banners/domain/entities/banners_entity.dart';

class ChangeStatusModel {
  ChangeStatusModel({
      this.message,});

  ChangeStatusModel.fromJson(dynamic json) {
    message = json['message'];
  }
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    return map;
  }
  ChangeStatusEntity toChangeStatusEntity() => ChangeStatusEntity(message: message);
}