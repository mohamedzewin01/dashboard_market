import 'package:dashboard_market/core/api/api_extentions.dart';
import 'package:dashboard_market/features/product_edit/data/data_sources/products_edit_data_source_repo.dart';
import 'package:dashboard_market/features/product_edit/domain/entities/edit_product_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/api/api_manager/api_manager.dart';
import '../../../../core/common/api_result.dart';
import '../models/request/edit_product_request.dart';

@Injectable(as: ProductsEditDataSourceRepo)
class ProductsEditDataSourceRepoImpl implements ProductsEditDataSourceRepo {
  ApiService apiService;

  ProductsEditDataSourceRepoImpl(this.apiService);


  @override
  Future<Result<EditProductModelEntity?>> editProductsData(
      EditProductRequestDto editProductRequest) {
  return executeApi(() async{
    var response = await apiService.editProduct2(editProductRequest);
    return response?.toEditProductEntity();
  },);
  }

  @override
  Future<Result<DeleteProductEntity?>> deleteProductsData(String productId) {
    return executeApi(()async {
      var response =await apiService.deleteProduct(productId);
      return response?.toDeleteProductEntity();
    },);
  }

  @override
  Future<Result<FetchCategoriesEditEntity?>> getCategoriesData() {
    return executeApi(()async {
      var response =await apiService.getCategoriesToEdit();
      return response?.toFetchCategoriesEditEntity();
    },);
  }


}
