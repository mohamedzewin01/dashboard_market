
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
  Future<Result<ProductsEntity?>> getLimitAllProducts(int? page) {
    return productsDataSourceRepo.getLimitAllProducts(page);
  }

  @override
  Future<Result<EditProductEntity?>> editProductsData(EditProductRequest editProductRequest) {
    return productsDataSourceRepo.editProductsData( editProductRequest);
  }

  @override
  Future<Result<ProductsEntity?>> getLimitProductsDiscount(int? page) {
 return productsDataSourceRepo.getLimitProductsDiscount(page);
  }

  @override
  Future<Result<ProductsEntity?>> getLimitProductsActive(int? page) {
  return productsDataSourceRepo.getLimitProductsActive(page);
  }

  @override
  Future<Result<ProductsEntity?>> getLimitProductsNotActive(int? page) {
    return productsDataSourceRepo.getLimitProductsNotActive(page);
  }

  @override
  Future<Result<ProductsEntity?>> getLimitProductsNotDiscount(int? page) {
    return productsDataSourceRepo.getLimitProductsNotDiscount(page);
  }


}
