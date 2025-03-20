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
  Future<Result<ProductsEntity?>> getProductsData() {
    return executeApi(() async {
      var response = await apiService.getProductsData();
      return response?.toHomeEntity();
    });
  }

  @override
  Future<Result<EditProductEntity?>> editProductsData(
      EditProductRequest editProductRequest) {
    return executeApi(() async {
      var response = await apiService.editProduct(editProductRequest);
      return response?.toEditProductEntity();
    });
  }

  @override
  Future<Result<DeleteProductEntity?>> deleteProductsData(String productId) {
   return executeApi(()async {
     var response =await apiService.deleteProduct(productId);
     return response?.toDeleteProductEntity();
   },);
  }
}
