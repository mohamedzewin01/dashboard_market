import '../../data/models/response/AllProductsRespose.dart';

class ProductsEntity {
  ProductsEntity({
    this.status,
    this.products,
  });

  String? status;
  List<Products>? products;
}

class DeleteProductEntity {

  String? message;


  DeleteProductEntity({ this.message,});


}
