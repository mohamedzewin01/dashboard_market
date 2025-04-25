part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}
final class CategoriesLoading extends CategoriesState {}
final class ChangeIdCategory extends CategoriesState {}
final class CategoriesSuccess extends CategoriesState {
  final FetchCategoriesEntity categoriesEntity;
  CategoriesSuccess(this.categoriesEntity);
}
final class CategoriesFailure extends CategoriesState {
  final Exception exception;
  CategoriesFailure(this.exception);
}

final class AddCategoriesSuccess extends CategoriesState {
  final AddCategoryEntity addCategoryEntity;
  AddCategoriesSuccess(this.addCategoryEntity);
}


