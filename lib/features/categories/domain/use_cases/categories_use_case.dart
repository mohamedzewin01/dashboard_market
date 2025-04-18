import 'dart:io';

import 'package:dashboard_market/core/common/api_result.dart';
import 'package:dashboard_market/features/add_images/domain/entities/delete_image_entity.dart';
import 'package:dashboard_market/features/add_images/domain/entities/image_upload_entity.dart';
import 'package:dashboard_market/features/add_images/domain/entities/images_entity.dart';
import 'package:dashboard_market/features/add_images/domain/repositories/images_repo.dart';
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
}
