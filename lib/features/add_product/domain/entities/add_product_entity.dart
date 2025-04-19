import 'package:dashboard_market/features/add_product/data/models/add_product_responces.dart';
import 'package:dashboard_market/features/add_product/data/models/images_dto.dart';

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