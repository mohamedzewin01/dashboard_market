// class ProductsSelected {
//   // خريطة تحتوي على id المنتج كـ مفتاح وقيم من نوع bool لتحديد ما إذا كان المنتج محددًا أم لا.
//   static Map<int, bool> isProductProduct = {};
//
//   // دالة لتحديد حالة منتج معين
//   static void setProductsProduct(int idProduct, bool value) {
//     // تحديد حالة المنتج
//     isProductProduct[idProduct] = value;
//     print(isProductProduct);
//   }
//
//   // دالة لتحديد المنتجات النشطة فقط
//   static void setActiveProducts() {
//     // لتحديد المنتجات النشطة فقط
//     Map<int, bool> activeProducts = {};
//     isProductProduct.forEach((id, isActive) {
//       if (isActive) {
//         activeProducts[id] = isActive;
//       }
//     });
//     print("المنتجات النشطة:");
//     print(activeProducts);
//   }
//
//   // دالة لتحديد المنتجات التي تحتوي على خصم أكبر من 0
//   static void setProductsWithDiscount() {
//     // لعرض المنتجات التي تحتوي على خصم
//     Map<int, bool> productsWithDiscount = {};
//     isProductProduct.forEach((id, discount) {
//       if (discount > 0) {
//         productsWithDiscount[id] = discount;
//       }
//     });
//     print("المنتجات التي تحتوي على خصم:");
//     print(productsWithDiscount);
//   }
// }
//
// void main() {
//   // اختبار الكود
//   ProductsSelected.setProductsProduct(1, true); // تحديد المنتج رقم 1
//   ProductsSelected.setProductsProduct(2, false); // تحديد المنتج رقم 2
//   ProductsSelected.setActiveProducts(); // عرض المنتجات النشطة
// }
