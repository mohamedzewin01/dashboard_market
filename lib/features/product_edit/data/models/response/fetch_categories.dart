import 'package:dashboard_market/features/product_edit/domain/entities/edit_product_entity.dart';
import 'package:dashboard_market/features/products/domain/entities/edit_product_entity.dart';
import 'package:json_annotation/json_annotation.dart';



part 'fetch_categories.g.dart';

@JsonSerializable()
class FetchCategoriesEdit {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "categories")
  final List<CategoriesEdit>? categories;

  FetchCategoriesEdit({
    this.status,
    this.categories,
  });

  factory FetchCategoriesEdit.fromJson(Map<String, dynamic> json) {
    return _$FetchCategoriesEditFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$FetchCategoriesEditToJson(this);
  }
  FetchCategoriesEditEntity toFetchCategoriesEditEntity() {
    return FetchCategoriesEditEntity(
      status: status,
      categories: categories,
    );
  }


}

@JsonSerializable()
class CategoriesEdit {
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

  CategoriesEdit({
    this.categoryId,
    this.categoryName,
    this.categoryImage,
    this.categoryStatus,
    this.categoryCreatAt,
  });

  factory CategoriesEdit.fromJson(Map<String, dynamic> json) {
    return _$CategoriesEditFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CategoriesEditToJson(this);
  }
}
