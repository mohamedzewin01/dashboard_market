


import 'package:dashboard_market/core/common/api_result.dart';
import 'package:dashboard_market/features/categories/data/data_sources/categories_data_sourses.dart';

import 'package:dashboard_market/features/categories/domain/entities/fetch_categories.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/categories_repo.dart';
@Injectable(as: CategoriesRepo)
class CategoriesRepoImpl  implements CategoriesRepo{
  CategoriesDataSources categoriesDataSources;
  CategoriesRepoImpl({required this.categoriesDataSources});
  @override
  Future<Result<FetchCategoriesEntity?>> fetchCategoriesData() {
    return categoriesDataSources.getCategories();
  }
}