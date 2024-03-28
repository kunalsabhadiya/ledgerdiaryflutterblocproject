import 'package:expense_repository/expense_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ledgerdiary/main.dart';
import 'package:ledgerdiary/screens/home/blocs/get_expense_bloc/get_expense_bloc.dart';
import 'package:ledgerdiary/screens/home/views/home_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LedgerDiary',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          background: Colors.grey.shade100,
          onBackground: Colors.black,
          primary: Color(0xff00B2E7),
          secondary: Color(0xffE064F7),
          tertiary: Color(0xffff8d6c),
        ),
        useMaterial3: true,
      ),
      home: BlocProvider(
          create: (context) => GetExpenseBloc(firebaseExpenseRepo())..add(getExpense()),
          child: const HomeScreen()),
    );
  }
}