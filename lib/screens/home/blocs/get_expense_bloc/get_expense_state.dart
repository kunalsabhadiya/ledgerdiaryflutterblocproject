part of 'get_expense_bloc.dart';

@immutable
sealed class GetExpenseState {

  const GetExpenseState();
  @override
  List<Object> get props => [];
}

final class GetExpenseInitial extends GetExpenseState {}
final class GetExpenseFailure extends GetExpenseState {}
final class GetExpenseLoading extends GetExpenseState {}
final class GetExpenseSuccess extends GetExpenseState {
  final List<Expense> expenseList;
  const GetExpenseSuccess({ required this.expenseList});

  @override
  List<Object> get props => [expenseList];
}
