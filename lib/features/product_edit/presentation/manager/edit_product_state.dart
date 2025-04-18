part of 'edit_product_cubit.dart';

@immutable
sealed class EditProductState {}

final class EditProductInitial extends EditProductState {}
final class ChangeChangeCategory extends EditProductState {}
