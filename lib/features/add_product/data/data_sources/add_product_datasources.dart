import 'package:dashboard_market/core/api/api_extentions.dart';
import 'package:dashboard_market/core/api/api_manager/api_manager.dart';
import 'package:dashboard_market/features/add_images/domain/entities/images_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/common/api_result.dart';
import '../../domain/entities/add_product_entity.dart';

@injectable
class AddProductDataSources {
  ApiService apiService;

  AddProductDataSources({required this.apiService});

  Future<Result<AddProductEntity?>> addProduct(
      String productName,
      num productPrice,
      num priceAfter,
      String description,
      String dateDiscount,
      int status,
      String imagePath,
      int categoryId) async {
    return executeApi(
      ()async {
        var response = await apiService.addProduct(
            productName,
            productPrice,
            priceAfter,
            description,
            dateDiscount,
            status,
            imagePath,
            categoryId);

        return response?.toAddProductEntity();
      },
    );
  }


  Future<Result<AllImagesEntity?>> addImages() async {
    return executeApi(
          ()async {
        var response = await apiService.getAllImage();

        return response?.toAllImagesEntity();
      },
    );
  }
}
