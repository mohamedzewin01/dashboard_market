import 'package:dashboard_market/features/categories/data/models/edit_category_dto.dart';
import 'package:dashboard_market/features/categories/data/models/products_by_categories_dto.dart';

import '../../data/models/add_category_responces.dart';
import '../../data/models/fetch_categories.dart';

class FetchCategoriesEntity {

  final String? status;

  final List<Categories>? categories;

  FetchCategoriesEntity ({
    this.status,
    this.categories,
  });

}

class AddCategoryEntity {
  final String? status;
  final Category? category;
  AddCategoryEntity ({
    this.status,
    this.category,
  });
}


class ProductsByCategoriesEntity {

  final ProductsData? productsData;

  ProductsByCategoriesEntity ({
    this.productsData,
  });



}

class EditCategoryEntity {

  final String? status;

  final bool? updated;

  final Data? data;

  EditCategoryEntity ({
    this.status,
    this.updated,
    this.data,
  });


}

class DeleteCategoryEntity {

  final String? status;

  final String? message;

  DeleteCategoryEntity ({
    this.status,
    this.message,
  });


}