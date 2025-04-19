import 'package:dashboard_market/core/common/api_result.dart';

import 'package:dashboard_market/features/add_product/domain/entities/add_product_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/add_product_repo.dart';
import '../data_sources/add_product_datasources.dart';


@Injectable(as: AddProductRepo)
class AddProductRepoImpl implements AddProductRepo {
  final AddProductDataSources addProductDataSources;

  AddProductRepoImpl({required this.addProductDataSources});

  @override
  Future<Result<AddProductEntity?>> addProduct(
      { required String productName,
        required num productPrice,
        required num priceAfter,
        required String description,
        required String dateDiscount,
        required int status,
        required  String imagePath,
        required int categoryId,}) {
    return addProductDataSources.addProduct(productName, productPrice,
        priceAfter, description, dateDiscount, status, imagePath, categoryId);
  }

  @override
  Future<Result<AllImagesEntity?>> addImages() {
 return addProductDataSources.addImages();
  }
}
