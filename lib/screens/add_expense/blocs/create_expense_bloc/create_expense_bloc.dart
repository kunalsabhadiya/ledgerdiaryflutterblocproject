import 'package:bloc/bloc.dart';
import 'package:expense_repository/expense_repository.dart';
import 'package:meta/meta.dart';

part 'create_expense_event.dart';
part 'create_expense_state.dart';

class CreateExpenseBloc extends Bloc<CreateExpenseEvent, CreateExpenseState> {
  ExpenseRepository expenseRepository;
  CreateExpenseBloc(this.expenseRepository) : super(CreateExpenseInitial()) {
    on<CreateExpenseEvent>((event, emit) async{
      try {
        emit(CreateExpenseLoading());
        if (event is CreateExpense) {
          await expenseRepository.createExpense(event.expense);
          emit(CreateExpenseSuccess());
        }
      }catch (e) {
        emit(CreateExpenseFailure());
      }
    });
  }
}
