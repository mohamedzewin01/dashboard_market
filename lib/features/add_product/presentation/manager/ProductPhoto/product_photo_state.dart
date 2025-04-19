part of 'product_photo_cubit.dart';

@immutable
sealed class ProductPhotoState {}

final class ProductPhotoInitial extends ProductPhotoState {}
final class ProductPhotoSuccess extends ProductPhotoState {
  final AllImagesEntity allImagesEntity;
  ProductPhotoSuccess(this.allImagesEntity);

}
final class ProductPhotoLoading extends ProductPhotoState {}
final class ProductPhotoFail extends ProductPhotoState {
  final Exception exception;
  ProductPhotoFail(this.exception);
}
