part of 'product_categories_edit_cubit.dart';

@immutable
sealed class ProductCategoriesEditState {}

final class ProductCategoriesEditInitial extends ProductCategoriesEditState {}
final class ProductCategoriesEditLoading extends ProductCategoriesEditState {}
final class ProductCategoriesEditSuccess extends ProductCategoriesEditState {
  final FetchCategoriesEditEntity fetchCategoriesEditEntity;

  ProductCategoriesEditSuccess(this.fetchCategoriesEditEntity);

}
final class ProductCategoriesEditFail extends ProductCategoriesEditState {
  final Exception exception;

  ProductCategoriesEditFail(this.exception);

}
