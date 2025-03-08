
import '../../../../core/common/api_result.dart';
import '../../domain/entities/products_entities.dart';

abstract class ProductsDataSourceRepo {
  Future<Result<ProductsEntity?>> getHomeData();
}
