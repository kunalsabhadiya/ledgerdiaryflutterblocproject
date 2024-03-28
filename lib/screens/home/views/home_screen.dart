import 'package:expense_repository/expense_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ledgerdiary/screens/add_expense/blocs/create_category_bloc/create_category_bloc.dart';
import 'package:ledgerdiary/screens/add_expense/blocs/create_expense_bloc/create_expense_bloc.dart';
import 'package:ledgerdiary/screens/add_expense/blocs/get_category_bloc/get_category_bloc.dart';
import 'package:ledgerdiary/screens/add_expense/views/add_expense.dart';
import 'package:ledgerdiary/screens/add_expense/views/category_creation.dart';
import 'package:ledgerdiary/screens/home/Stats/StatScreen.dart';
import 'package:ledgerdiary/screens/home/blocs/get_expense_bloc/get_expense_bloc.dart';
import 'package:ledgerdiary/screens/home/views/main_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var widgetList = [
     const MainScreen([]),
    const StatScreen()
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetExpenseBloc, GetExpenseState>(
  builder: (context, state) {
    if(state is GetExpenseSuccess){
      return Scaffold(

        body: index == 0 ?  MainScreen(state.expenseList) : const StatScreen(),
        bottomNavigationBar: ClipRRect(
          borderRadius:
          const BorderRadius.vertical(
              top: Radius.circular(30)
          ),
          child: BottomNavigationBar(
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
            backgroundColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home,
                    color: Colors.black87,),
                  label: "Home",
                  activeIcon: Icon(Icons.home,
                    color: Color(0xff00B2E7),)

              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.graphic_eq_sharp,
                    color: Colors.black87,),
                  label: "Graph",
                  activeIcon: Icon(Icons.graphic_eq_sharp,
                    color: Color(0xff00B2E7),)
              ),
            ],
          ),

        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () async{
            Expense? newExpense =await Navigator.push(
              context,
              MaterialPageRoute<Expense>(
                  builder: (BuildContext context) => MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => CreateCategoryBloc(firebaseExpenseRepo()),
                        child: const AddExpense(),
                      ),
                      BlocProvider(
                        create: (context) => GetCategoryBloc(firebaseExpenseRepo())..add(GetCategory()),
                        child: const AddExpense(),
                      ),
                      BlocProvider(
                        create: (context) => CreateExpenseBloc(firebaseExpenseRepo()),
                        child: const AddExpense(),
                      ),
                    ],
                    child: const AddExpense(),
                  )),
            );
            if(newExpense != null){
              setState(() {
                state.expenseList.insert(0,newExpense);
              });
              }
          },
          shape: const CircleBorder(),
          child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffff8d6c),
                      Color(0xffE064F7),
                      Color(0xff00B2E7),
                    ],
                    transform: GradientRotation(45),
                  )
              ),
              child: const Icon(Icons.add)
          ),
        ),
      );
    }else {
      return const Scaffold(
        body:  Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  },
);
  }
}