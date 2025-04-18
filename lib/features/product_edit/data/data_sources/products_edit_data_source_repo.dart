import 'package:dashboard_market/features/product_edit/domain/entities/edit_product_entity.dart';
import '../../../../core/common/api_result.dart';
import '../models/request/edit_product_request.dart';

abstract class ProductsEditDataSourceRepo {
  Future<Result<DeleteProductEntity?>> deleteProductsData(String productId);

  Future<Result<EditProductModelEntity?>> editProductsData(
      EditProductRequestDto editProductRequest);
  Future<Result<FetchCategoriesEditEntity?>>getCategoriesData();
}
