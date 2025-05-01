import 'dart:io';

import 'package:dashboard_market/core/api/api_extentions.dart';
import 'package:dashboard_market/core/api/api_manager/api_manager.dart';
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
        final response = await apiService.addProduct(
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
        final response = await apiService.getAllImage();

        return response?.toAllImagesEntity();
      },
    );
  }


  Future<Result<DeleteProductImageEntity?>> deleteProductImage(
      String imageId,   String imageName) async {
    return executeApi(
          () async {
        final response = await apiService.deleteProductImage(imageId, imageName);
        return response?.toDeleteImageEntity();
      },
    );
  }

  Future<Result<UpLoadImageProductEntity?>> upLoadProductImage(
      File file, String name, String imageCategory) async {
    return executeApi(
          () async {
        final response = await apiService.uploadProductImage(file, name, imageCategory);
        return response?.toUpLoadImageProductEntity();
      },
    );
  }
}
