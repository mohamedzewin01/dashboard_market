
import 'package:dashboard_market/features/products/domain/entities/edit_product_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../../domain/entities/products_entities.dart';
import '../../domain/repo/products_repo.dart';
import '../data_sources/products_data_source_repo.dart';
import '../models/request/edit_product_request.dart';

@Injectable(as: ProductsRepo)
class ProductsRepoImpl implements ProductsRepo {
  ProductsDataSourceRepo productsDataSourceRepo;

  ProductsRepoImpl(this.productsDataSourceRepo);

  @override
  Future<Result<ProductsEntity?>> getProductsData() {
    return productsDataSourceRepo.getProductsData();
  }

  @override
  Future<Result<EditProductEntity?>> editProductsData(EditProductRequest editProductRequest) {
    return productsDataSourceRepo.editProductsData( editProductRequest);
  }


}
