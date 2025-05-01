import 'package:dashboard_market/features/add_product/data/models/add_product_responces.dart';
import 'package:dashboard_market/features/add_product/data/models/delete_product_image.dart';
import 'package:dashboard_market/features/add_product/data/models/images_dto.dart';
import 'package:dashboard_market/features/add_product/data/models/upload_image_product_dto.dart';

class AddProductEntity {

  final String? status;


  final Product? product;

  AddProductEntity ({
    this.status,
    this.product,
  });
}

class AllImagesEntity {
  AllImagesEntity({
    this.status,
    this.images,});


  String? status;
  List<AllImages>? images;


}

class UpLoadImageProductEntity {
  UpLoadImageProductEntity({
    this.status,
    this.image,});


  String? status;
  ImageProduct? image;


}


class DeleteProductImageEntity {

  final String? status;

  final DeleteProductImage? deletedData;

  DeleteProductImageEntity ({
    this.status,
    this.deletedData,
  });




}