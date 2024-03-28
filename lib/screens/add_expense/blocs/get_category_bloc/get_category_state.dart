part of 'get_category_bloc.dart';

@immutable
sealed class GetCategoryState {}

final class GetCategoryInitial extends GetCategoryState {}
final class GetCategoryFailure extends GetCategoryState {}
final class GetCategoryLoading extends GetCategoryState {}
final class GetCategorySuccess extends GetCategoryState {
  final List<Category> categories;

  GetCategorySuccess(this.categories);

  List<Object> get props => [categories];
}
