part of 'edit_category_cubit.dart';

@immutable
sealed class EditCategoryState {}

final class EditCategoryInitial extends EditCategoryState {}
final class EditCategoryChangeImage extends EditCategoryState {}
final class EditCategorySuccess extends EditCategoryState {
  final EditCategoryEntity editCategoryEntity;
  EditCategorySuccess(this.editCategoryEntity);
}
final class EditCategoryFailure extends EditCategoryState {
  final Exception exception;
  EditCategoryFailure(this.exception);
}
final class EditCategoryLoading extends EditCategoryState {}
