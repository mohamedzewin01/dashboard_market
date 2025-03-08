import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../features/products/data/models/response/AllProductsRespose.dart';
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
}

// @POST(ApiConstants.categories)
  // Future<CategoriesZoneResponse> getCategories(
  //     @Part(name: 'id_zone') int idZone);

//  @MultiPart()
