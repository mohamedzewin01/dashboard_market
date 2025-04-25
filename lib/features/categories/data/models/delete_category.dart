import 'package:dashboard_market/features/categories/domain/entities/fetch_categories.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delete_category.g.dart';

@JsonSerializable()
class DeleteCategoryDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "message")
  final String? message;

  DeleteCategoryDto({
    this.status,
    this.message,
  });

  factory DeleteCategoryDto.fromJson(Map<String, dynamic> json) {
    return _$DeleteCategoryDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DeleteCategoryDtoToJson(this);
  }

  DeleteCategoryEntity toDeleteCategoryEntity() =>
      DeleteCategoryEntity(status: status, message: message);
}
