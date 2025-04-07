import 'dart:io';

import 'package:dashboard_market/features/add_images/data/models/images_model.dart';
import 'package:dashboard_market/features/add_product/data/models/add_product_responces.dart';
import 'package:dashboard_market/features/banners/data/models/response/AddBannerModel.dart';
import 'package:dashboard_market/features/banners/data/models/response/ChangeStatusModel.dart';
import 'package:dashboard_market/features/banners/data/models/response/banners_models_response.dart';
import 'package:dashboard_market/features/banners/data/models/response/delete_banner_model.dart';
import 'package:dashboard_market/features/categories/data/models/fetch_categories.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../../features/add_images/data/models/delete_image.dart';
import '../../../features/add_images/data/models/upload_image_model.dart';
import '../../../features/categories/data/models/add_category_responces.dart';
import '../../../features/products/data/models/request/edit_product_request.dart';
import '../../../features/products/data/models/response/AllProductsRespose.dart';
import '../../../features/products/data/models/response/delete_product_responces.dart';
import '../../../features/products/data/models/response/edit_product_response.dart';
import '../../../features/setting/data/models/store_info_edit_response.dart';
import '../../../features/setting/data/models/store_info_request.dart';
import '../../../features/setting/data/models/store_info_responce.dart';
import '../../../features/setting/data/models/upload_image_store_response.dart';
import '../api_constants.dart';

part 'api_manager.g.dart';

@injectable
@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  @FactoryMethod()
  factory ApiService(Dio dio) = _ApiService;

  @POST(ApiConstants.products)
  Future<AllProductsResponse?> getProductsData();

  @POST(ApiConstants.editProducts)
  Future<EditProductResponse?> editProduct(
      @Body() EditProductRequest? editProductRequest);

  @POST(ApiConstants.fetchImages)
  Future<ImagesModel?> getImagesData();

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

  @POST(ApiConstants.deleteProduct)
  Future<DeleteProductResponses?> deleteProduct(
      @Part(name: 'productid') String? productId,);


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


}
