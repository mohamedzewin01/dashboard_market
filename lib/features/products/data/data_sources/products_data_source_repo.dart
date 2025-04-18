
import 'package:dashboard_market/features/products/domain/entities/edit_product_entity.dart';

import '../../../../core/common/api_result.dart';
import '../../domain/entities/products_entities.dart';
import '../models/request/edit_product_request.dart';

abstract class ProductsDataSourceRepo {
  Future<Result<ProductsEntity?>> getProductsData();
  // Future<Result<DeleteProductEntity?>> deleteProductsData(String productId);
  Future<Result<EditProductEntity?>> editProductsData(EditProductRequest editProductRequest);
  // Future<Result<FetchCategoriesEditEntity?>> getCategoriesToEdit();
}
