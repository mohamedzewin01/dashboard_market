import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/fetch_categories.dart';

part 'add_category_responces.g.dart';

@JsonSerializable()
class AddCategoryResponse {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "category")
  final Category? category;

  AddCategoryResponse({
    this.status,
    this.category,
  });

  factory AddCategoryResponse.fromJson(Map<String, dynamic> json) {
    return _$AddCategoryResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddCategoryResponseToJson(this);
  }

  AddCategoryEntity toAddCategoryEntity() =>
      AddCategoryEntity(status: status, category: category);
}

@JsonSerializable()
class Category {
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

  Category({
    this.categoryId,
    this.categoryName,
    this.categoryImage,
    this.categoryStatus,
    this.categoryCreatAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return _$CategoryFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CategoryToJson(this);
  }
}
