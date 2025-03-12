part of 'images_cubit.dart';

@immutable
sealed class ImagesState {}

final class ImagesInitial extends ImagesState {}
final class SuccessImages extends ImagesState {
final ImagesEntity imagesEntity;

  SuccessImages(this.imagesEntity);
}
final class LoadingImages extends ImagesState {}
final class ErrorImages extends ImagesState {
  final Exception exception;

  ErrorImages(this.exception);
}
