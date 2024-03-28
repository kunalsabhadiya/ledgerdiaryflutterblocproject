part of 'create_category_bloc.dart';

@immutable
sealed class CreateCategoryState {}

final class CreateCategoryInitial extends CreateCategoryState {}
final class CreateCategoryFailure extends CreateCategoryState {}
final class CreateCategorySuccess extends CreateCategoryState {}
final class CreateCategoryLoading extends CreateCategoryState {}
