import 'package:dashboard_market/features/products/data/models/response/AllProductsResponse.dart';


class ProductsEntity {
  ProductsEntity({
    this.status,
    this.products,
    this.page,
    this.limit,
    this.total,
  });
  num? page;
  num? limit;
  num? total;
  num? pages;
  String? status;
  List<Products>? products;
}


