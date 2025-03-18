// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_manager.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations

class _ApiService implements ApiService {
  _ApiService(this._dio, {this.baseUrl, this.errorLogger}) {
    baseUrl ??= 'https://artawiya.com/fadaalhalj/api/v1/';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<AllProductsResponse?> getProductsData() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<AllProductsResponse>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'products/fetchAllProducts.php',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>?>(_options);
    late AllProductsResponse? _value;
    try {
      _value = _result.data == null
          ? null
          : AllProductsResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<EditProductResponse?> editProduct(
    EditProductRequest? editProductRequest,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(editProductRequest?.toJson() ?? <String, dynamic>{});
    final _options = _setStreamType<EditProductResponse>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'products/editProduct.php',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>?>(_options);
    late EditProductResponse? _value;
    try {
      _value = _result.data == null
          ? null
          : EditProductResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ImagesModel?> getImagesData() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ImagesModel>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'images/fetchImages.php',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>?>(_options);
    late ImagesModel? _value;
    try {
      _value =
          _result.data == null ? null : ImagesModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<UpLoadImageModel?> uploadImage(
    File? imageFile,
    String? imageName,
    String? imageCategory,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (imageFile != null) {
      _data.files.add(
        MapEntry(
          'image',
          MultipartFile.fromFileSync(
            imageFile.path,
            filename: imageFile.path.split(Platform.pathSeparator).last,
          ),
        ),
      );
    }
    if (imageName != null) {
      _data.fields.add(MapEntry('ImageName', imageName));
    }
    if (imageCategory != null) {
      _data.fields.add(MapEntry('ImageCategory', imageCategory));
    }
    final _options = _setStreamType<UpLoadImageModel>(
      Options(
        method: 'POST',
        headers: _headers,
        extra: _extra,
        contentType: 'multipart/form-data',
      )
          .compose(
            _dio.options,
            'images/uploadImage.php',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>?>(_options);
    late UpLoadImageModel? _value;
    try {
      _value = _result.data == null
          ? null
          : UpLoadImageModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<DeleteImage?> deleteImage(String? imageId, String? imageName) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (imageId != null) {
      _data.fields.add(MapEntry('imageId', imageId));
    }
    if (imageName != null) {
      _data.fields.add(MapEntry('image', imageName));
    }
    final _options = _setStreamType<DeleteImage>(
      Options(
        method: 'POST',
        headers: _headers,
        extra: _extra,
        contentType: 'multipart/form-data',
      )
          .compose(
            _dio.options,
            'images/deleteImage.php',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>?>(_options);
    late DeleteImage? _value;
    try {
      _value =
          _result.data == null ? null : DeleteImage.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<AddProductResponse?> addProduct(
    String? productName,
    num? productPrice,
    num? priceAfter,
    String? description,
    String? dateDiscount,
    int? status,
    String? imagePath,
    int? category,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (productName != null) {
      _data.fields.add(MapEntry('name', productName));
    }
    if (productPrice != null) {
      _data.fields.add(MapEntry('price', productPrice.toString()));
    }
    if (priceAfter != null) {
      _data.fields.add(MapEntry('price_after', priceAfter.toString()));
    }
    if (description != null) {
      _data.fields.add(MapEntry('app_description', description));
    }
    if (dateDiscount != null) {
      _data.fields.add(MapEntry('date_descount', dateDiscount));
    }
    if (status != null) {
      _data.fields.add(MapEntry('stauts', status.toString()));
    }
    if (imagePath != null) {
      _data.fields.add(MapEntry('imagePath', imagePath));
    }
    if (category != null) {
      _data.fields.add(MapEntry('category', category.toString()));
    }
    final _options = _setStreamType<AddProductResponse>(
      Options(
        method: 'POST',
        headers: _headers,
        extra: _extra,
        contentType: 'multipart/form-data',
      )
          .compose(
            _dio.options,
            'products/addproduct.php',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>?>(_options);
    late AddProductResponse? _value;
    try {
      _value = _result.data == null
          ? null
          : AddProductResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<FetchCategoriesResponse?> getCategories() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<FetchCategoriesResponse>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'categories/fetchCategories.php',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>?>(_options);
    late FetchCategoriesResponse? _value;
    try {
      _value = _result.data == null
          ? null
          : FetchCategoriesResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
