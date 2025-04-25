

import 'dart:io';

import 'package:dashboard_market/features/categories/data/models/fetch_categories.dart';
import 'package:dashboard_market/features/categories/domain/entities/fetch_categories.dart';

import '../../../../core/common/api_result.dart';

abstract class CategoriesRepo {
  Future<Result<FetchCategoriesEntity?>> fetchCategoriesData();
  Future<Result<AddCategoryEntity?>> addCategory( File imageFile, String categoryName, int status);
  Future<Result<ProductsByCategoriesEntity?>> getProductByCategories(int? idCategory);
  Future<Result<EditCategoryEntity?>> editProductByCategories(int categoryId,
      String? categoryName, String? oldImagePath, File? newImage);
}