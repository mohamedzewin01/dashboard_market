import 'dart:io';

import 'package:dashboard_market/core/common/api_result.dart';
import 'package:dashboard_market/features/add_images/domain/entities/delete_image_entity.dart';
import 'package:dashboard_market/features/add_images/domain/entities/image_upload_entity.dart';
import 'package:dashboard_market/features/add_images/domain/entities/images_entity.dart';
import 'package:dashboard_market/features/add_images/domain/repositories/images_repo.dart';
import 'package:dashboard_market/features/add_product/domain/entities/add_product_entity.dart';
import 'package:dashboard_market/features/add_product/domain/repositories/add_product_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddProductUseCase {
  AddProductRepo addProductRepo;
  AddProductUseCase(this.addProductRepo);
  Future<Result<AddProductEntity?>> addProduct({
    required String productName,
    required num productPrice,
    required num priceAfter,
    required String description,
    required String dateDiscount,
    required int status,
    required  String imagePath,
    required int categoryId,
  }) {
    return addProductRepo.addProduct(
        productName: productName,
        productPrice: productPrice,
        priceAfter: priceAfter,
        description: description,
        dateDiscount: dateDiscount,
        status: status,
        imagePath: imagePath,
        categoryId: categoryId);
  }

  Future<Result<AllImagesEntity?>> getAllImages() {
    return addProductRepo.addImages();
  }
}
