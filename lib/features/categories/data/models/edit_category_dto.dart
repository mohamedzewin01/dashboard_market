import 'package:dashboard_market/features/categories/domain/entities/fetch_categories.dart';
import 'package:json_annotation/json_annotation.dart';

part 'edit_category_dto.g.dart';

@JsonSerializable()
class EditCategoryDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "updated")
  final bool? updated;
  @JsonKey(name: "data")
  final Data? data;

  EditCategoryDto ({
    this.status,
    this.updated,
    this.data,
  });

  factory EditCategoryDto.fromJson(Map<String, dynamic> json) {
    return _$EditCategoryDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$EditCategoryDtoToJson(this);
  }
  EditCategoryEntity toEditCategoryEntity() {
    return EditCategoryEntity(
      status: status,
      updated: updated,
      data: data,
    );
  }
}

@JsonSerializable()
class Data {
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

  Data ({
    this.categoryId,
    this.categoryName,
    this.categoryImage,
    this.categoryStatus,
    this.categoryCreatAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }
}


