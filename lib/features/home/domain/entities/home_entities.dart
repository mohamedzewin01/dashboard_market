import '../../data/models/response/AllProductsRespose.dart';

class HomeEntity {
  HomeEntity({
    this.status,
    this.products,
  });

  String? status;
  List<Products>? products;
}