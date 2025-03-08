import '../../../../core/common/api_result.dart';
import '../entities/products_entities.dart';

abstract class ProductsRepo {
  Future<Result<ProductsEntity?>> getProductsData();
}
