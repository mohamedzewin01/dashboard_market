import 'package:dashboard_market/features/product_edit/data/models/request/edit_product_request.dart';
import 'package:dashboard_market/features/product_edit/domain/entities/edit_product_entity.dart';
import '../../../../core/common/api_result.dart';

abstract class ProductsEditRepo {
  Future<Result<EditProductModelEntity?>> editProductsData(
      EditProductRequestDto editProductRequest);

  Future<Result<DeleteProductEntity?>> deleteProductsData(String productId);
Future<Result<FetchCategoriesEditEntity?>> getCategoriesToEdit();
}
