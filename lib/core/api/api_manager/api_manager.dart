import 'dart:io';

import 'package:dashboard_market/features/add_images/data/models/images_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../features/add_images/data/models/upload_image_model.dart';
import '../../../features/products/data/models/request/edit_product_request.dart';
import '../../../features/products/data/models/response/AllProductsRespose.dart';
import '../../../features/products/data/models/response/edit_product_response.dart';
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
      @Part(name:'image') File? imageFile,
      @Part(name:'ImageName') String? imageName,
      @Part(name:'ImageCategory') String? imageCategory
      );

}



