import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController expenseController = TextEditingController();

  TextEditingController categoryController = TextEditingController();

  TextEditingController dateController = TextEditingController();
  List<String> expenseCategories = [
    'dinnertable',
    'grocerycart',
    'healthcare',
    'house',
    'mortarboard',
    'restaurant',
    'saving',
    'settings',
    'shoppingcart',
    'video',
    'transportation',
  ];



  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    dateController.text = DateFormat("dd-MM-yyyy").format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
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
                      borderRadius: BorderRadius.all(Radius.circular(30)),
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
                onTap: () {

                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: const Icon(
                    FontAwesomeIcons.list,
                    size: 18,
                    color: Colors.grey,
                  ),
                  suffixIcon: IconButton(

                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              String iconSelected = '';
                              Color categoryColor = Colors.white;
                              bool isExpended = false;
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return AlertDialog(
                                    title: const Text("Create a category"),
                                    content: SizedBox(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width,
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextFormField(
                                              textAlignVertical: TextAlignVertical
                                                  .center,

                                              decoration: const InputDecoration(
                                                fillColor: Colors.white,
                                                filled: true,
                                                isDense: true,
                                                hintText: "Name",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius
                                                      .all(Radius.circular(12)),
                                                  borderSide: BorderSide.none,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 20,),
                                            TextFormField(
                                              textAlignVertical: TextAlignVertical
                                                  .center,
                                              readOnly: true,
                                              onTap: () {
                                                setState(() {
                                                  isExpended = !isExpended;
                                                });
                                              },

                                              decoration: InputDecoration(
                                                fillColor: Colors.white,
                                                filled: true,
                                                isDense: true,
                                                hintText: "Icon",
                                                suffixIcon: const Icon(
                                                  FontAwesomeIcons.chevronDown,
                                                  color: Colors.grey,
                                                  size: 14,),
                                                hintStyle: const TextStyle(
                                                    color: Colors.grey),
                                                border: OutlineInputBorder(
                                                  borderRadius: isExpended
                                                      ? const BorderRadius
                                                      .vertical(
                                                      top: Radius.circular(12))
                                                      : const BorderRadius.all(
                                                      Radius.circular(12)),
                                                  borderSide: BorderSide.none,
                                                ),
                                              ),
                                            ),
                                            isExpended ? Container(
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              height: 200,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius
                                                    .vertical(
                                                    bottom: Radius.circular(12)
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 12, right: 12),
                                                child: GridView.builder(
                                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 3,
                                                    mainAxisSpacing: 30,
                                                    crossAxisSpacing: 30,
                                                  ),

                                                  itemCount: expenseCategories
                                                      .length,
                                                  itemBuilder: (context,
                                                      int i) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          iconSelected = expenseCategories[i];
                                                        });
                                                      },
                                                      child: Container(
                                                        width: 20,
                                                        height: 20,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: iconSelected
                                                                    ==
                                                                    expenseCategories[i]
                                                                    ? Colors.green
                                                                    : Colors.grey,
                                                               width: 3),
                                                            borderRadius: const BorderRadius
                                                                .all(
                                                                Radius.circular(
                                                                    12)),
                                                            image: DecorationImage(
                                                              image: AssetImage(
                                                                  'assets/${expenseCategories[i]}.png'),
                                                              fit: BoxFit.cover,
                                                            )
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),

                                            ) : Container(),
                                            const SizedBox(height: 20,),
                                            TextFormField(
                                              textAlignVertical: TextAlignVertical
                                                  .center,
                                              readOnly: true,
                                              onTap: (){
                                                showDialog(
                                                    context: context,
                                                    builder: (ctx2){
                                                      return AlertDialog(
                                                        content: Column(
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            ColorPicker(
                                                              pickersEnabled: const <ColorPickerType,bool>{
                                                                ColorPickerType.both: false,
                                                                ColorPickerType.customSecondary: false,
                                                                ColorPickerType.wheel: true,
                                                                ColorPickerType.primary: false,
                                                                ColorPickerType.accent: false,
                                                              },
                                                            onColorChanged: (value){
                                                                setState(() {
                                                                  categoryColor = value;
                                                                });
                                                            },
                                                            ),
                                                            SizedBox(
                                                              width: double.infinity,
                                                              height: 50,
                                                              child: TextButton(
                                                                  onPressed: () {
                                                                    Navigator.pop(context);
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
                                                        ),
                                                      );
                                                    });
                                              },

                                              decoration:  InputDecoration(
                                                fillColor: categoryColor,
                                                filled: true,
                                                isDense: true,
                                                hintText: "Color",
                                                hintStyle: const TextStyle(
                                                    color: Colors.grey),
                                                border: const OutlineInputBorder(
                                                  borderRadius: BorderRadius
                                                      .all(Radius.circular(12)),
                                                  borderSide: BorderSide.none,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 20,),
                                            SizedBox(
                                              width: double.infinity,
                                              height: 50,
                                              child: TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
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

                                          ]
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                        );
                      },
                      icon: const Icon(FontAwesomeIcons.plus,
                          size: 18,
                          color: Colors.grey)
                  ),
                  hintText: "Category",
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide.none,
                  ),
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
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                      initialDate: selectedDate,
                    );
                    if (newDate != null) {
                      setState(() {
                        dateController.text =
                            DateFormat("dd-MM-yyyy").format(newDate);
                        selectedDate = newDate;
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
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
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
          ),
        ),
      ),
    );
  }
}
