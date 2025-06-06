import 'dart:io';

import 'package:dashboard_market/core/common/api_result.dart';
import 'package:dashboard_market/features/categories/data/data_sources/categories_data_sourses.dart';

import 'package:dashboard_market/features/categories/domain/entities/fetch_categories.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/categories_repo.dart';

@Injectable(as: CategoriesRepo)
class CategoriesRepoImpl implements CategoriesRepo {
  CategoriesDataSources categoriesDataSources;

  CategoriesRepoImpl({required this.categoriesDataSources});

  @override
  Future<Result<FetchCategoriesEntity?>> fetchCategoriesData() {
    return categoriesDataSources.getCategories();
  }

  @override
  Future<Result<AddCategoryEntity?>> addCategory(
      File imageFile, String categoryName, int status) {
    return categoriesDataSources.addCategories(imageFile, categoryName, status);
  }

  @override
  Future<Result<ProductsByCategoriesEntity?>> getProductByCategories(
      int? idCategory) {
    return categoriesDataSources.getProductByCategories(idCategory);
  }

  @override
  Future<Result<EditCategoryEntity?>> editProductByCategories(int categoryId,
      String? categoryName, String? oldImagePath, File? newImage) {
    return categoriesDataSources.editProductByCategories(
        categoryId, categoryName, oldImagePath, newImage);
  }

  @override
  Future<Result<DeleteCategoryEntity?>> deleteProductByCategories(int categoryId, String imageName) {
   return categoriesDataSources.deleteProductByCategories(categoryId, imageName);
  }
}
