
import 'package:dashboard_market/features/products/domain/entities/edit_product_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../../data/models/request/edit_product_request.dart';
import '../entities/products_entities.dart';
import '../repo/products_repo.dart';

@injectable
class ProductsUseCase {
  ProductsRepo productsRepo;

  ProductsUseCase(this.productsRepo);

  Future<Result<ProductsEntity?>> getLimitAllProducts(int? page) {
    return productsRepo.getLimitAllProducts(page);
  }
  Future<Result<ProductsEntity?>> getLimitProductsDiscount(int? page) {
    return productsRepo.getLimitProductsDiscount(page);
  }
  Future<Result<ProductsEntity?>> getLimitProductsNotDiscount(int? page) {
    return productsRepo.getLimitProductsNotDiscount(page);
  }
  Future<Result<ProductsEntity?>> getLimitProductsActive(int? page) {
    return productsRepo.getLimitProductsActive(page);
  }
  Future<Result<ProductsEntity?>> getLimitProductsNotActive(int? page) {
    return productsRepo.getLimitProductsNotActive(page);
  }
  Future<Result<EditProductEntity?>> editProductsData(EditProductRequest editProductRequest) {
    return productsRepo.editProductsData(editProductRequest);
  }
}
