import 'dart:io';

import 'package:dashboard_market/core/common/api_result.dart';
import 'package:dashboard_market/features/categories/domain/entities/fetch_categories.dart';
import 'package:dashboard_market/features/categories/domain/repositories/categories_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoriesUseCase {
  CategoriesRepo categoriesRepo;

  CategoriesUseCase(this.categoriesRepo);

  Future<Result<FetchCategoriesEntity?>> getCategoriesData() =>
      categoriesRepo.fetchCategoriesData();

  Future<Result<AddCategoryEntity?>> addCategory(
          File imageFile, String categoryName, int status) =>
      categoriesRepo.addCategory(imageFile, categoryName, status);

  Future<Result<ProductsByCategoriesEntity?>> getProductByCategories(
          int? idCategory) =>
      categoriesRepo.getProductByCategories(idCategory);

  Future<Result<EditCategoryEntity?>> editProductByCategories(
          {
            required int categoryId,
          String? categoryName,
          String? oldImagePath,
          File? newImage}) =>
      categoriesRepo.editProductByCategories(categoryId, categoryName, oldImagePath, newImage);


  Future<Result<DeleteCategoryEntity?>> deleteProductByCategories(int categoryId,String imageName) =>
      categoriesRepo.deleteProductByCategories(categoryId, imageName);
}
