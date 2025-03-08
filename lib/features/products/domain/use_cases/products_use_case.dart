
import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../entities/products_entities.dart';
import '../repo/products_repo.dart';

@injectable
class HomeUseCase {
  ProductsRepo productsRepo;

  HomeUseCase(this.productsRepo);

  Future<Result<ProductsEntity?>> getHomeData() {
    return productsRepo.getProductsData();
  }
}
