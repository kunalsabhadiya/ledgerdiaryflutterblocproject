part of 'get_expense_bloc.dart';

@immutable
sealed class GetExpenseEvent {

  const GetExpenseEvent();
  @override
  List<Object> get props => [];
}

class getExpense extends GetExpenseEvent {
}
