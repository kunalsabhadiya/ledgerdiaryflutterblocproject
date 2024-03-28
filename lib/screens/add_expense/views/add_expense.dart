import 'package:expense_repository/expense_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:ledgerdiary/screens/add_expense/blocs/create_expense_bloc/create_expense_bloc.dart';
import 'package:ledgerdiary/screens/add_expense/blocs/get_category_bloc/get_category_bloc.dart';
import 'package:ledgerdiary/screens/add_expense/views/category_creation.dart';
import 'package:uuid/uuid.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController expenseController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  late Expense expense;
  bool isLoading = false;

  @override
  void initState() {
    dateController.text = DateFormat("dd-MM-yyyy").format(DateTime.now());
    expense = Expense.empty();
    expense.expenseId = const Uuid().v1() ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateExpenseBloc, CreateExpenseState>(
      listener: (context, state) {
        if (state is CreateExpenseSuccess) {
          Navigator.pop(context,expense);
        } else if (state is CreateExpenseLoading) {
          setState(() {
            isLoading = true;
          });
        }
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .background,
          appBar: AppBar(
            backgroundColor: Theme
                .of(context)
                .colorScheme
                .background,
          ),
          body: BlocBuilder<GetCategoryBloc, GetCategoryState>(
            builder: (context, state) {
              if (state is GetCategorySuccess) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Add Expense",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.7,
                            child: TextFormField(
                              controller: expenseController,
                              keyboardType: TextInputType.number,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: const InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                prefixIcon: Icon(
                                  FontAwesomeIcons.indianRupeeSign,
                                  size: 18,
                                  color: Colors.green,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(30)),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          TextFormField(
                            controller: categoryController,
                            textAlignVertical: TextAlignVertical.center,
                            readOnly: true,
                            onTap: () {},
                            decoration: InputDecoration(
                              fillColor: expense.category == Category.empty
                                  ? Colors.white
                                  : Color(expense.category.color),
                              filled: true,
                              prefixIcon: expense.category == Category.empty
                                  ? const Icon(
                                FontAwesomeIcons.list,
                                size: 18,
                                color: Colors.grey,
                              )
                                  : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: Image.asset(
                                    'assets/${expense.category.icon}.png',
                                    scale: 2,
                                    alignment: Alignment.center,
                                  ),
                                ),
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () async {
                                    var newCategory =
                                    await getCategoryCreation(context);
                                    setState(() {
                                      state.categories.insert(0, newCategory);
                                    });
                                  },
                                  icon: const Icon(FontAwesomeIcons.plus,
                                      size: 18, color: Colors.grey)),
                              hintText: "Category",
                              hintStyle: const TextStyle(color: Colors.grey),
                              border: const OutlineInputBorder(
                                borderRadius:
                                BorderRadius.vertical(top: Radius.circular(12)),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          Container(
                            height: 200,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.vertical(bottom: Radius.circular(12)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView.builder(
                                  itemCount: state.categories.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                        child: ListTile(
                                          onTap: () {
                                            setState(() {
                                              expense.category =
                                              state.categories[index];
                                              categoryController.text =
                                                  expense.category.name;
                                            });
                                          },
                                          leading: SizedBox(
                                              width: 30,
                                              height: 30,
                                              child: Image.asset(
                                                'assets/${state.categories[index]
                                                    .icon}.png',
                                                scale: 2,
                                              )),
                                          title: Text(state.categories[index].name),
                                          tileColor: Color(
                                              state.categories[index].color),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                8.0),
                                          ),
                                        ));
                                  }),
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          TextFormField(
                            controller: dateController,
                            textAlignVertical: TextAlignVertical.center,
                            readOnly: true,
                            onTap: () async {
                              {
                                DateTime? newDate = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime.now(),
                                  lastDate:
                                  DateTime.now().add(const Duration(days: 365)),
                                  initialDate: expense.date,
                                );
                                if (newDate != null) {
                                  setState(() {
                                    dateController.text =
                                        DateFormat("dd-MM-yyyy").format(newDate);
                                    expense.date = newDate;
                                  });
                                }
                              }
                            },
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Icon(
                                FontAwesomeIcons.calendar,
                                size: 18,
                                color: Colors.grey,
                              ),
                              hintText: "Date",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: isLoading == true ? const Center(
                              child: CircularProgressIndicator(),) : TextButton(
                                onPressed: () {
                                  setState(() {
                                    expense.amount =
                                        int.parse(expenseController.text);
                                  });
                                  context.read<CreateExpenseBloc>().add(
                                      CreateExpense(expense: expense));
                                },
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.black87,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    )),
                                child: const Text(
                                  "Save",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
