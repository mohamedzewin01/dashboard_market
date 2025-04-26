

import '../../features/products/data/models/response/AllProductsRespose.dart';

class ProductsSelected {
  static Map<int, bool> isProductProduct = {};

  static void setProductsProduct(int idProduct, bool value) {
    isProductProduct[idProduct] = value;
    print(isProductProduct);
  }
  static void selectAllProduct({required List<Products> products}) {
    for (var element in products) {
      isProductProduct[element.idProduct??0] = true;
    }

  }
  static void cancelSelect() {
    isProductProduct = {};

  }
  static void setProductsWithDiscount({required List<Products> products}) {
    for (var element in products) {

      if (element.descount != null && element.descount! > 0) {

        isProductProduct[element.idProduct ?? 0] = true;
        print(isProductProduct);
      }
    }
  }

}




