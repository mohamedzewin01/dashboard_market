part of 'home_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsSuccess extends ProductsState {
  final ProductsEntity? homeEntity;

  ProductsSuccess(this.homeEntity);
}

final class ProductsFail extends ProductsState {
  final Exception exception;

  ProductsFail(this.exception);
}
