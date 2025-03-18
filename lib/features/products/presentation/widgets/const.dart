import '../../data/models/response/AllProductsRespose.dart';

List<Products> products = [];
List<Products> productsOn = products.where((element) => element.status == 1).toList();
List<Products> productsOff = products.where((element) => element.status == 0).toList();