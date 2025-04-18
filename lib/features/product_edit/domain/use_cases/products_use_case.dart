import 'package:dashboard_market/features/product_edit/data/models/request/edit_product_request.dart';
import 'package:dashboard_market/features/product_edit/domain/entities/edit_product_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/common/api_result.dart';
import '../repo/products_repo.dart';

@injectable
class ProductsEditUseCase {
  ProductsEditRepo productsRepo;

  ProductsEditUseCase(this.productsRepo);

  Future<Result<EditProductModelEntity?>> editProductsData(
      EditProductRequestDto editProductRequest) {
    return productsRepo.editProductsData(editProductRequest);}

  Future<Result<DeleteProductEntity?>> deleteProductsData(String productId) {
    return productsRepo.deleteProductsData(productId);
  }
Future<Result<FetchCategoriesEditEntity?>> getCategoriesToEdit() {
  return productsRepo.getCategoriesToEdit();

}
}
