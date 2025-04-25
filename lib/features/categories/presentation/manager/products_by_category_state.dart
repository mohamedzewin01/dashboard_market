part of 'products_by_category_cubit.dart';

@immutable
sealed class ProductsByCategoryState {}

final class ProductsByCategoryInitial extends ProductsByCategoryState {}
final class ProductsByCategoryLoading extends ProductsByCategoryState {}
final class ProductsByCategorySuccess extends ProductsByCategoryState {
  final ProductsByCategoriesEntity productsByCategoriesEntity;
  ProductsByCategorySuccess(this.productsByCategoriesEntity);
}

final class ProductsByCategoryFail extends ProductsByCategoryState {
  final Exception exception;
  ProductsByCategoryFail(this.exception);
}
