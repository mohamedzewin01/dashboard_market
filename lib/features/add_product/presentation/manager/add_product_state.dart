part of 'add_product_cubit.dart';

@immutable
sealed class AddProductState {}

final class AddProductInitial extends AddProductState {}
final class ChangeImage extends AddProductState {}
final class ChangeProductStatus extends AddProductState {}
final class AddProductLoading extends AddProductState {}
final class AddProductSuccess extends AddProductState {
  final AddProductEntity? addProductEntity;

  AddProductSuccess(this.addProductEntity);
}
final class AddProductFailure extends AddProductState {
  final Exception? exception;

  AddProductFailure(this.exception);
}
