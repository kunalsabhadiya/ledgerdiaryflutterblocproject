part of 'get_category_bloc.dart';

@immutable
sealed class GetCategoryEvent  {

  const GetCategoryEvent();
  @override
  List<Object> get props => [];
}

class GetCategory extends GetCategoryEvent  {

}
