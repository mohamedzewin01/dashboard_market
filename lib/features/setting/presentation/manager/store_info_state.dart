part of 'store_info_cubit.dart';

@immutable
sealed class StoreInfoState {}

final class StoreInfoInitial extends StoreInfoState {}
final class StoreInfoSuccess extends StoreInfoState {
  final StoreInfoEntity storeInfoEntity;

  StoreInfoSuccess(this.storeInfoEntity);

}
final class StoreInfoLoading extends StoreInfoState {
}
final class StoreInfoFailure extends StoreInfoState {
  final Exception exception;

  StoreInfoFailure(this.exception);
}
