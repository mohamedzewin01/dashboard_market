
import 'package:dashboard_market/features/products/domain/entities/edit_product_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../../data/models/request/edit_product_request.dart';
import '../entities/products_entities.dart';
import '../repo/products_repo.dart';

@injectable
class HomeUseCase {
  ProductsRepo productsRepo;

  HomeUseCase(this.productsRepo);

  Future<Result<ProductsEntity?>> getHomeData() {
    return productsRepo.getProductsData();
  }
  Future<Result<EditProductEntity?>> editProductsData(EditProductRequest editProductRequest) {
    return productsRepo.editProductsData(editProductRequest);
  }
}
