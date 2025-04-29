
import 'package:dashboard_market/features/products/domain/entities/edit_product_entity.dart';

import '../../../../core/common/api_result.dart';
import '../../domain/entities/products_entities.dart';
import '../models/request/edit_product_request.dart';

abstract class ProductsDataSourceRepo {
  Future<Result<ProductsEntity?>> getLimitAllProducts(int? page);
  Future<Result<ProductsEntity?>> getLimitProductsDiscount(int? page);
  Future<Result<ProductsEntity?>> getLimitProductsNotDiscount(int? page);
  Future<Result<ProductsEntity?>> getLimitProductsActive(int? page);
  Future<Result<ProductsEntity?>> getLimitProductsNotActive(int? page);

  Future<Result<EditProductEntity?>> editProductsData(EditProductRequest editProductRequest);

}
