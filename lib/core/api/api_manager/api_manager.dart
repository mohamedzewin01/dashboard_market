import 'dart:io';
import 'package:dashboard_market/features/add_images/data/models/images_model.dart';
import 'package:dashboard_market/features/add_product/data/models/add_product_responces.dart';
import 'package:dashboard_market/features/add_product/data/models/images_dto.dart';
import 'package:dashboard_market/features/banners/data/models/response/AddBannerModel.dart';
import 'package:dashboard_market/features/banners/data/models/response/ChangeStatusModel.dart';
import 'package:dashboard_market/features/banners/data/models/response/banners_models_response.dart';
import 'package:dashboard_market/features/banners/data/models/response/delete_banner_model.dart';
import 'package:dashboard_market/features/categories/data/models/delete_category.dart';
import 'package:dashboard_market/features/categories/data/models/edit_category_dto.dart';
import 'package:dashboard_market/features/categories/data/models/fetch_categories.dart';
import 'package:dashboard_market/features/categories/data/models/products_by_categories_dto.dart';
import 'package:dashboard_market/features/home/data/models/dashboard_statistics_dto.dart';
import 'package:dashboard_market/features/product_edit/data/models/request/edit_product_request.dart';
import 'package:dashboard_market/features/product_edit/data/models/response/delete_product_responces.dart';
import 'package:dashboard_market/features/product_edit/data/models/response/edit_product_response.dart';
import 'package:dashboard_market/features/product_edit/data/models/response/fetch_categories.dart';
import 'package:dashboard_market/features/products/data/models/response/AllProductsResponse.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../../features/add_images/data/models/delete_image.dart';
import '../../../features/add_images/data/models/upload_image_model.dart';
import '../../../features/categories/data/models/add_category_responces.dart';
import '../../../features/products/data/models/request/edit_product_request.dart';
import '../../../features/products/data/models/response/edit_product_response.dart';
import '../../../features/setting/data/models/store_info_edit_response.dart';
import '../../../features/setting/data/models/store_info_request.dart';
import '../../../features/setting/data/models/store_info_responce.dart';
import '../../../features/setting/data/models/upload_image_store_response.dart';
import '../api_constants.dart';

part 'api_manager.g.dart';

@injectable
@singleton
@RestApi(baseUrl: 'https://artawiya.com/fadaalhalj/api/v2/')
abstract class ApiService {
  @FactoryMethod()
  factory ApiService(Dio dio) = _ApiService;

  @POST(ApiConstants.getLimitAllProducts)
  Future<AllProductsResponse?> getLimitAllProducts(
    @Part(name: 'page') int? page
  );

  @POST(ApiConstants.getLimitProductsDiscount)
  Future<AllProductsResponse?> getLimitProductsDiscount(
      @Part(name: 'page') int? page
      );

  @POST(ApiConstants.getLimitProductsNotDiscount)
  Future<AllProductsResponse?> getLimitProductsNotDiscount(
      @Part(name: 'page') int? page
      );

  @POST(ApiConstants.getLimitProductsActive)
  Future<AllProductsResponse?> getLimitProductsActive(
      @Part(name: 'page') int? page
      );

  @POST(ApiConstants.getLimitProductsNotActive)
  Future<AllProductsResponse?> getLimitProductsNotActive(
      @Part(name: 'page') int? page
      );

  @POST(ApiConstants.editProducts)
  Future<EditProductResponse?> editProduct(
      @Body() EditProductRequest? editProductRequest);

  @POST(ApiConstants.editProducts)
  Future<EditProductResponseDto?> editProduct2(
      @Body() EditProductRequestDto? editProductRequest);

  @POST(ApiConstants.fetchImages)
  Future<ImagesModel?> getImagesData();

  @POST(ApiConstants.fetchImages)
  Future<ImagesDto?> getAllImage();

  @POST(ApiConstants.uploadImage)
  @MultiPart()
  Future<UpLoadImageModel?> uploadImage(
      @Part(name: 'image') File? imageFile,
      @Part(name: 'ImageName') String? imageName,
      @Part(name: 'ImageCategory') String? imageCategory);

  @POST(ApiConstants.deleteImage)
  @MultiPart()
  Future<DeleteImage?> deleteImage(@Part(name: 'imageId') String? imageId,
      @Part(name: 'image') String? imageName);

  @POST(ApiConstants.addProduct)
  @MultiPart()
  Future<AddProductResponse?> addProduct(
    @Part(name: 'name') String? productName,
    @Part(name: 'price') num? productPrice,
    @Part(name: 'price_after') num? priceAfter,
    @Part(name: 'app_description') String? description,
    @Part(name: 'date_descount') String? dateDiscount,
    @Part(name: 'stauts') int? status,
    @Part(name: 'imagePath') String? imagePath,
    @Part(name: 'category') int? category,
  );

  @POST(ApiConstants.fetchCategories)
  Future<FetchCategoriesResponse?> getCategories();

  @POST(ApiConstants.fetchCategories)
  Future<FetchCategoriesEdit?> getCategoriesToEdit();

  @POST(ApiConstants.deleteProduct)
  Future<DeleteProductResponses?> deleteProduct(
    @Part(name: 'productid') String? productId,
  );

  @POST(ApiConstants.addCategories)
  @MultiPart()
  Future<AddCategoryResponse?> addCategory(
      @Part(name: 'image') File? imageFile,
      @Part(name: 'name') String? categoryName,
      @Part(name: 'status') int? status);

  @POST(ApiConstants.storeInfo)
  Future<StoreInfoResponse?> getStoreInfo();

  @POST(ApiConstants.editStoreInfo)
  Future<StoreInfoEditResponse?> editStoreInfo(
      @Body() StoreInfoRequest? storeInfoRequest);

  @POST(ApiConstants.uploadImageStore)
  @MultiPart()
  Future<UploadImageStoreResponse?> uploadImageStore(
    @Part(name: 'image') File? imageFile,
    @Part(name: 'imagePath') String? categoryName,
  );

  @POST(ApiConstants.fetchBanners)
  Future<BannersModelsResponse?> fetchBanners();

  @POST(ApiConstants.addBanners)
  @MultiPart()
  Future<AddBannerModel?> addBanner(
    @Part(name: 'title') String? title,
    @Part(name: 'description') String? description,
    @Part(name: 'productId') String? productId,
    @Part(name: 'imagePath') File? imagePath,
    @Part(name: 'status') String? status,
  );

  @POST(ApiConstants.deleteBanners)
  @MultiPart()
  Future<DeleteBannerModel?> deleteBanner(
    @Part(name: 'bannersID') String? bannersId,
    @Part(name: 'image_name') String? imagePath,
  );

  @POST(ApiConstants.editBanners)
  @MultiPart()
  Future<ChangeStatusModel?> changeStatus(
    @Part(name: 'bannersId') String? bannersId,
    @Part(name: 'bannersStatus') String? status,
  );

  @POST(ApiConstants.dashboardStatistics)
  Future<DashboardStatisticsDto?> getDashboardStatistics();

  @POST(ApiConstants.getProductsByCategories)
  Future<ProductsByCategoriesDto?> getProductsByCategories(
      @Part(name: 'idCategory') int? idCategory);

  @POST(ApiConstants.updateCategory)
  @MultiPart()
  Future<EditCategoryDto?> updateCategory(
      @Part(name: 'category_id') int categoryId,
      @Part(name: 'category_name') String? categoryName,
      @Part(name: 'oldImagePath') String? oldImagePath,
      @Part(name: 'newImage') File? newImage);

  @POST(ApiConstants.deleteCategory)
  @MultiPart()
  Future<DeleteCategoryDto?> deleteCategory(
    @Part(name: 'categoryId') int categoryId,
    @Part(name: 'image_name') String? imageName,
  );
}
