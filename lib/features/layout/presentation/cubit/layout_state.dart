part of 'layout_cubit.dart';

@immutable
sealed class LayoutState {}

final class LayoutInitial extends LayoutState {}

final class LayoutChangePage extends LayoutState {}

final class ChangeNEMBER extends LayoutState {}