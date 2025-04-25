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
final class DeleteCategorySuccess extends EditCategoryState {
  final DeleteCategoryEntity deleteCategoryEntity;
  DeleteCategorySuccess(this.deleteCategoryEntity);
}
final class DeleteCategoryFailure extends EditCategoryState {
  final Exception exception;
  DeleteCategoryFailure(this.exception);
}
final class DeleteCategoryLoading extends EditCategoryState {}