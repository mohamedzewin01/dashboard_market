

import '../../../../core/common/api_result.dart';
import '../entities/add_product_entity.dart';

abstract class AddProductRepo {

  Future<Result<AddProductEntity?>> addProduct({
    required String productName,
    required num productPrice,
    required num priceAfter,
    required String description,
    required String dateDiscount,
    required int status,
    required  String imagePath,
    required int categoryId,
  });
  Future<Result<AllImagesEntity?>> addImages();

}