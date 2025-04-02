part of 'banners_cubit.dart';

@immutable
sealed class BannersState {}

final class BannersInitial extends BannersState {}
final class BannersLoading extends BannersState {}
final class BannersSuccess extends BannersState {

  final BannersEntity? bannersEntity;
  BannersSuccess(this.bannersEntity);
}
final class BannersFailure extends BannersState {
  final Exception exception;
  BannersFailure(this.exception);
}
