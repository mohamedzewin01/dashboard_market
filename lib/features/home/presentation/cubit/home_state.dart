part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final HomeEntity? homeEntity;

  HomeSuccess(this.homeEntity);
}

final class HomeFail extends HomeState {
  final Exception exception;

  HomeFail(this.exception);
}
