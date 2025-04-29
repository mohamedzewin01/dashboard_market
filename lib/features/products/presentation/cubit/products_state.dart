part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}
final class ChangeCurrentPage extends ProductsState {}

final class ProductsSuccess extends ProductsState {
  final ProductsEntity? productsEntity;

  ProductsSuccess(this.productsEntity);
}

final class ProductsFail extends ProductsState {
  final Exception exception;

  ProductsFail(this.exception);
}


final class ProductsDiscountLoading extends ProductsState {}

final class ProductsDiscountSuccess extends ProductsState {
  final ProductsEntity? productsEntity;

  ProductsDiscountSuccess(this.productsEntity);
}

final class ProductsDiscountFail extends ProductsState {
  final Exception exception;

  ProductsDiscountFail(this.exception);
}



final class ProductsNotDiscountLoading extends ProductsState {}

final class ProductsNotDiscountSuccess extends ProductsState {
  final ProductsEntity? productsEntity;

  ProductsNotDiscountSuccess(this.productsEntity);
}

final class ProductsNotDiscountFail extends ProductsState {
  final Exception exception;

  ProductsNotDiscountFail(this.exception);
}


final class ProductsActiveLoading extends ProductsState {}

final class ProductsActiveSuccess extends ProductsState {
  final ProductsEntity? productsEntity;

  ProductsActiveSuccess(this.productsEntity);
}

final class ProductsActiveFail extends ProductsState {
  final Exception exception;

  ProductsActiveFail(this.exception);
}


final class ProductsNotActiveLoading extends ProductsState {}

final class ProductsNotActiveSuccess extends ProductsState {
  final ProductsEntity? productsEntity;

  ProductsNotActiveSuccess(this.productsEntity);
}

final class ProductsNotActiveFail extends ProductsState {
  final Exception exception;

  ProductsNotActiveFail(this.exception);
}