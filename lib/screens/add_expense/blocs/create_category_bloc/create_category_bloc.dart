import 'package:bloc/bloc.dart';
import 'package:expense_repository/expense_repository.dart';
import 'package:meta/meta.dart';

part 'create_category_event.dart';

part 'create_category_state.dart';

class CreateCategoryBloc
    extends Bloc<CreateCategoryEvent, CreateCategoryState> {
  final ExpenseRepository expenseRepository;

  CreateCategoryBloc(this.expenseRepository) : super(CreateCategoryInitial()) {
    on<CreateCategoryEvent>((event, emit) async {
      emit(CreateCategoryLoading());
      try {
        await expenseRepository.createCategory(event.props[0] as Category);
        emit(CreateCategorySuccess());
      } catch (e) {
        emit(CreateCategoryFailure());
      }
    });
  }
}
