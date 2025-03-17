import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/fetch_categories.dart';

part 'fetch_categories.g.dart';

@JsonSerializable()
class FetchCategoriesResponse {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "categories")
  final List<Categories>? categories;

  FetchCategoriesResponse({
    this.status,
    this.categories,
  });

  factory FetchCategoriesResponse.fromJson(Map<String, dynamic> json) {
    return _$FetchCategoriesResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$FetchCategoriesResponseToJson(this);
  }


  FetchCategoriesEntity toFetchCategoriesEntity() =>
      FetchCategoriesEntity(status: status, categories: categories);
}

@JsonSerializable()
class Categories {
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

  Categories({
    this.categoryId,
    this.categoryName,
    this.categoryImage,
    this.categoryStatus,
    this.categoryCreatAt,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return _$CategoriesFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CategoriesToJson(this);
  }
}
