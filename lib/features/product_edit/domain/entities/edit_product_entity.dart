

import 'package:dashboard_market/features/product_edit/data/models/response/fetch_categories.dart';

class EditProductModelEntity {
  EditProductModelEntity({
    this.message,
  });

  String? message;
}

class FetchCategoriesEditEntity {
  final String? status;

  final List<CategoriesEdit>? categories;

  FetchCategoriesEditEntity({
    this.status,
    this.categories,
  });
}

class DeleteProductEntity {
  String? message;

  DeleteProductEntity({
    this.message,
  });
}
