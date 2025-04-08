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