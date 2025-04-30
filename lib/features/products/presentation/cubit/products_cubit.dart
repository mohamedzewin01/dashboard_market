import 'dart:developer';

import 'package:dashboard_market/features/products/data/models/response/AllProductsResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../../data/models/request/edit_product_request.dart';
import '../../domain/entities/products_entities.dart';
import '../../domain/use_cases/products_use_case.dart';

part 'products_state.dart';

@injectable
class ProductsCubit extends Cubit<ProductsState> {
  final ProductsUseCase _productsUseCase;

  ProductsCubit(this._productsUseCase) : super(ProductsInitial());

  static ProductsCubit get(context) => BlocProvider.of(context);

  int currentPage = 1;
  bool _isLoadingMore = false;
  bool _hasMore = true;
  num totalProducts = 0;
  late TabController tabController;

  void changeCurrentPage(int page) {
    currentPage = page;
    emit(ChangeCurrentPage());
  }

  Future<void> getLimitAllProducts({bool isFirstFetch = false}) async {
    if (isFirstFetch) {
      currentPage = 2;
    }
    _isLoadingMore = true;

    final result = await _productsUseCase.getLimitAllProducts(currentPage);

    switch (result) {
      case Success<ProductsEntity?>():
        {
          if (!isClosed) {

            final oldProducts = (state is ProductsSuccess)
                ? (state as ProductsSuccess).productsEntity?.products ?? []
                : [];

            final newProducts = result.data?.products ?? [];

            final List<Products> allProducts = [...oldProducts, ...newProducts];
             totalProducts = result.data?.total ?? 0;
            emit(ProductsSuccess(
              ProductsEntity(
                products: allProducts,
                page: result.data?.page,
                limit: result.data?.limit,
                total: result.data?.total,
                status: result.data?.status,
              ),
            ));

            currentPage++; // نزود الصفحة
            _hasMore = (currentPage <= (result.data?.pages ?? 0));
          }
        }
      case Fail<ProductsEntity>():
        {
          if (!isClosed) emit(ProductsFail(result.exception));
        }
    }

    _isLoadingMore = false;
  }

  Future<void> getLimitProductsDiscount({bool isFirstFetch = false}) async {
    if (isFirstFetch) {
      currentPage = 2;
    }
    _isLoadingMore = true;

    final result = await _productsUseCase.getLimitProductsDiscount(currentPage);
    switch (result) {
      case Success<ProductsEntity?>():
        {
          if (!isClosed) {
            final oldProducts = (state is ProductsDiscountSuccess)
                ? (state as ProductsDiscountSuccess).productsEntity?.products ??
                    []
                : [];

            final newProducts = result.data?.products ?? [];

            // دمج المنتجات القديمة والجديدة
            final List<Products> allProducts = [...oldProducts, ...newProducts];

            emit(ProductsDiscountSuccess(
              ProductsEntity(
                products: allProducts,
                page: result.data?.page,
                limit: result.data?.limit,
                total: result.data?.total,
                status: result.data?.status,
              ),
            ));

            currentPage++;
            _hasMore = (currentPage <= (result.data?.pages ?? 0));
          }
        }
        break;

      case Fail<ProductsEntity?>():
        {
          if (!isClosed) emit(ProductsDiscountFail(result.exception));
        }
        break;
    }

    _isLoadingMore = false;
  }

  Future<void> getLimitProductsNotDiscount({bool isFirstFetch = false}) async {
    if (isFirstFetch) {
      currentPage = 2;
    }
    _isLoadingMore = true;

    final result =
        await _productsUseCase.getLimitProductsNotDiscount(currentPage);
    switch (result) {
      case Success<ProductsEntity?>():
        {
          if (!isClosed) {
            final oldProducts = (state is ProductsNotDiscountSuccess)
                ? (state as ProductsNotDiscountSuccess)
                        .productsEntity
                        ?.products ??
                    []
                : [];

            final newProducts = result.data?.products ?? [];

            // دمج المنتجات القديمة والجديدة
            final List<Products> allProducts = [...oldProducts, ...newProducts];

            emit(ProductsNotDiscountSuccess(
              ProductsEntity(
                products: allProducts,
                page: result.data?.page,
                limit: result.data?.limit,
                total: result.data?.total,
                status: result.data?.status,
              ),
            ));

            currentPage++;
            _hasMore = (currentPage <= (result.data?.pages ?? 0));
          }
        }
        break;

      case Fail<ProductsEntity?>():
        {
          if (!isClosed) emit(ProductsNotDiscountFail(result.exception));
        }
        break;
    }

    _isLoadingMore = false;
  }

  Future<void> getLimitProductsActive({bool isFirstFetch = false}) async {
    if (isFirstFetch) {
      currentPage = 1;
    }
    _isLoadingMore = true;

    final result = await _productsUseCase.getLimitProductsActive(currentPage);
    switch (result) {
      case Success<ProductsEntity?>():
        {
          if (!isClosed) {
            final oldProducts = (state is ProductsActiveSuccess)
                ? (state as ProductsActiveSuccess).productsEntity?.products ??
                    []
                : [];

            final newProducts = result.data?.products ?? [];

            // دمج المنتجات القديمة والجديدة
            final List<Products> allProducts = [...oldProducts, ...newProducts];

            emit(ProductsActiveSuccess(
              ProductsEntity(
                products: allProducts,
                page: result.data?.page,
                limit: result.data?.limit,
                total: result.data?.total,
                status: result.data?.status,
              ),
            ));

            currentPage++;
            _hasMore = (currentPage <= (result.data?.pages ?? 0));
          }
        }
        break;

      case Fail<ProductsEntity?>():
        {
          if (!isClosed) emit(ProductsActiveFail(result.exception));
        }
        break;
    }

    _isLoadingMore = false;
  }

  Future<void> getLimitProductsNotActive({bool isFirstFetch = false}) async {
    if (isFirstFetch) {
      currentPage = 2;
    }
    _isLoadingMore = true;

    final result =
        await _productsUseCase.getLimitProductsNotActive(currentPage);
    switch (result) {
      case Success<ProductsEntity?>():
        {
          if (!isClosed) {
            final oldProducts = (state is ProductsNotActiveSuccess)
                ? (state as ProductsNotActiveSuccess)
                        .productsEntity
                        ?.products ??
                    []
                : [];

            final newProducts = result.data?.products ?? [];

            // دمج المنتجات القديمة والجديدة
            final List<Products> allProducts = [...oldProducts, ...newProducts];

            emit(ProductsNotActiveSuccess(
              ProductsEntity(
                products: allProducts,
                page: result.data?.page,
                limit: result.data?.limit,
                total: result.data?.total,
                status: result.data?.status,
              ),
            ));

            currentPage++;
            _hasMore = (currentPage <= (result.data?.pages ?? 0));
          }
        }
        break;

      case Fail<ProductsEntity?>():
        {
          if (!isClosed) emit(ProductsNotActiveFail(result.exception));
        }
        break;
    }

    _isLoadingMore = false;
  }

  TextEditingController searchController = TextEditingController();
  String searchQuery = "";
  int? selectedCategoryId;

  Future<void> editProduct(EditProductRequest editProductRequest) async {
    await _productsUseCase.editProductsData(editProductRequest);
    log('Success');
  }
}
