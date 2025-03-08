
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_extentions.dart';
import '../../../../core/api/api_manager/api_manager.dart';
import '../../../../core/common/api_result.dart';
import '../../domain/entities/products_entities.dart';
import 'products_data_source_repo.dart';

@Injectable(as: ProductsDataSourceRepo)
class ProductsDataSourceRepoImpl implements ProductsDataSourceRepo {
  ApiService apiService;

  ProductsDataSourceRepoImpl(this.apiService);

  @override
  Future<Result<ProductsEntity?>> getHomeData() {
    return executeApi(() async {
      var response = await apiService.getProductsData();
      return response?.toHomeEntity();
    });
  }
}
