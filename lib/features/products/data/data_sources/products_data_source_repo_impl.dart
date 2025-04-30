import 'package:dashboard_market/features/products/domain/entities/edit_product_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_extentions.dart';
import '../../../../core/api/api_manager/api_manager.dart';
import '../../../../core/common/api_result.dart';
import '../../domain/entities/products_entities.dart';
import '../models/request/edit_product_request.dart';
import 'products_data_source_repo.dart';

@Injectable(as: ProductsDataSourceRepo)
class ProductsDataSourceRepoImpl implements ProductsDataSourceRepo {
  ApiService apiService;

  ProductsDataSourceRepoImpl(this.apiService);

  @override
  Future<Result<ProductsEntity?>> getLimitAllProducts(int? page) {
    return executeApi(() async {
      final response = await apiService.getLimitAllProducts(page);
      return response?.toHomeEntity();
    });
  }
  @override
  Future<Result<ProductsEntity?>> getLimitProductsDiscount(int? page) {
    return executeApi(() async {
      final response = await apiService.getLimitProductsDiscount(page);
      return response?.toHomeEntity();
    });
  }


  @override
  Future<Result<ProductsEntity?>> getLimitProductsActive(int? page) {
    return executeApi(() async {
      final response = await apiService.getLimitProductsActive(page);
      return response?.toHomeEntity();
    });
  }

  @override
  Future<Result<ProductsEntity?>> getLimitProductsNotActive(int? page) {
    return executeApi(() async {
      final response = await apiService.getLimitProductsNotActive( page);
      return response?.toHomeEntity();
    });
  }

  @override
  Future<Result<ProductsEntity?>> getLimitProductsNotDiscount(int? page) {
    return executeApi(() async {
      final response = await apiService.getLimitProductsNotDiscount(page);
      return response?.toHomeEntity();
    });
  }
  @override
  Future<Result<EditProductEntity?>> editProductsData(
      EditProductRequest editProductRequest) {
    return executeApi(() async {
      final response = await apiService.editProduct(editProductRequest);
      return response?.toEditProductEntity();
    });
  }



}
