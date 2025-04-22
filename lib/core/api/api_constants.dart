

import 'package:dashboard_market/core/secrets.dart';

class ApiConstants {
  static const String baseUrlImage = "${Secrets.baseUrl}upload/";
  static const String home = "products/viewHome";
  static const String products = "products/fetchAllProducts.php";
  static const String editProducts = "products/editProduct.php";
  static const String fetchImages = "images/fetchImages.php";
  static const String uploadImage = "images/uploadImage.php";
  static const String deleteImage = "images/deleteImage.php";
  static const String addProduct = "products/addproduct.php";
  static const String fetchCategories = "categories/fetchCategories.php";
  static const String addCategories = "categories/addCategory.php";
  static const String storeInfo = "setting/storeInfo.php";
  static const String editStoreInfo = "setting/editStoreInfo.php";
  static const String uploadImageStore = "setting/uploadImageStore.php";
  static const String deleteProduct = "products/delete_Product.php";
  static const String fetchBanners = "banners/fetchBanners.php";
  static const String addBanners = "banners/addbanners.php";
  static const String deleteBanners = "banners/delete_banners";
  static const String editBanners = "banners/editbanners.php";
  static const String dashboardStatistics = "dashboard/dashboardStatistics";
}
