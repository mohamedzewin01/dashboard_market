part of 'add_banners_cubit.dart';

@immutable
sealed class AddBannersState {}

final class AddBannersInitial extends AddBannersState {}
final class AddBannersLoading extends AddBannersState {}
final class AddBannersChangeStatus extends AddBannersState {}
final class AddBannersChangeTitle extends AddBannersState {}
final class AddBannersChangeSubTitle extends AddBannersState {}
final class AddBannersChangeImage extends AddBannersState {}
final class AddBannersSuccess extends AddBannersState {

  final AddBannersEntity? addBannersEntity;
  AddBannersSuccess(this.addBannersEntity);
}
final class AddBannersFailure extends AddBannersState {
  final Exception exception;
  AddBannersFailure(this.exception);
}