import 'package:dashboard_market/features/product_edit/data/data_sources/products_edit_data_source_repo.dart';
import 'package:dashboard_market/features/product_edit/domain/entities/edit_product_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';

import '../../domain/repo/products_repo.dart';

import '../models/request/edit_product_request.dart';

@Injectable(as: ProductsEditRepo)
class ProductsRepoImpl implements ProductsEditRepo {
  ProductsEditDataSourceRepo productsDataSourceRepo;

  ProductsRepoImpl(this.productsDataSourceRepo);

  @override
  Future<Result<EditProductModelEntity?>> editProductsData(
      EditProductRequestDto editProductRequest) {
    return productsDataSourceRepo.editProductsData(editProductRequest);
  }

  @override
  Future<Result<DeleteProductEntity?>> deleteProductsData(String productId) {
    return productsDataSourceRepo.deleteProductsData(productId);
  }

@override
Future<Result<FetchCategoriesEditEntity?>> getCategoriesToEdit() {
  return productsDataSourceRepo.getCategoriesData();
}
}
