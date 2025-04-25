import 'dart:io';

import 'package:dashboard_market/core/api/api_manager/api_manager.dart';
import 'package:dashboard_market/features/categories/domain/entities/fetch_categories.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_extentions.dart';
import '../../../../core/common/api_result.dart';

@injectable
class CategoriesDataSources {
  ApiService apiService;

  CategoriesDataSources(this.apiService);

  Future<Result<FetchCategoriesEntity?>> getCategories() async {
    return executeApi(
      () async {
        var response = await apiService.getCategories();
        return response?.toFetchCategoriesEntity();
      },
    );
  }

  Future<Result<AddCategoryEntity?>> addCategories(
      File imageFile, String categoryName, int status) async {
    return executeApi(
      () async {
        var response =
            await apiService.addCategory(imageFile, categoryName, status);
        return response?.toAddCategoryEntity();
      },
    );
  }

  Future<Result<ProductsByCategoriesEntity?>> getProductByCategories(
      int? idCategory) async {
    return executeApi(
      () async {
        var response = await apiService.getProductsByCategories(idCategory);
        return response?.toProductsByCategoriesEntity();
      },
    );
  }

  Future<Result<EditCategoryEntity?>> editProductByCategories(int categoryId,
      String? categoryName, String? oldImagePath, File? newImage) {
    return executeApi(
      () async {
        var response = await apiService.updateCategory(
            categoryId, categoryName, oldImagePath, newImage);
        return response?.toEditCategoryEntity();
      },
    );
  }
  Future<Result<DeleteCategoryEntity?>> deleteProductByCategories(int categoryId,String imageName) {
    return executeApi(
      () async {
        var response = await apiService.deleteCategory(categoryId, imageName);
        return response?.toDeleteCategoryEntity();
      },
    );
  }
}
