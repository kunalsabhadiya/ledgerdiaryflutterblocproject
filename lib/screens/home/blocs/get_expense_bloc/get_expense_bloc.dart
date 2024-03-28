import 'package:bloc/bloc.dart';
import 'package:expense_repository/expense_repository.dart';
import 'package:meta/meta.dart';

part 'get_expense_event.dart';
part 'get_expense_state.dart';

class GetExpenseBloc extends Bloc<GetExpenseEvent, GetExpenseState> {
  ExpenseRepository expenseRepository;
  GetExpenseBloc(this.expenseRepository) : super(GetExpenseInitial()) {
    on<GetExpenseEvent>((event, emit) async{
      emit(GetExpenseLoading());
      try {
        List<Expense> expenseList =await expenseRepository.getExpense();
          emit(GetExpenseSuccess(expenseList: expenseList));
      }catch(e){
        emit(GetExpenseFailure());
      }
    });
  }
}
