import 'package:dashboard_market/features/products/domain/entities/edit_product_entity.dart';

import '../../../../core/common/api_result.dart';
import '../../data/models/request/edit_product_request.dart';
import '../entities/products_entities.dart';

abstract class ProductsRepo {
  Future<Result<ProductsEntity?>> getProductsData();
  Future<Result<DeleteProductEntity?>> deleteProductsData(String productId);
  Future<Result<EditProductEntity?>> editProductsData(EditProductRequest editProductRequest);
}
