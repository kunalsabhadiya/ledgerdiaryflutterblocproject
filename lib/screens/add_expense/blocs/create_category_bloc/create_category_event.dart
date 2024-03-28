part of 'create_category_bloc.dart';

@immutable
sealed class CreateCategoryEvent {
  const CreateCategoryEvent();
  @override
  List<Object> get props => [];
}

 class CreateCategory extends CreateCategoryEvent {
  @override
  final Category category;
  CreateCategory({required this.category});

  List<Object> get props => [category];
}

