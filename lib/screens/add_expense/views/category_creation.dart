import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:ledgerdiary/screens/add_expense/blocs/create_category_bloc/create_category_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:expense_repository/expense_repository.dart';
import 'package:flex_color_picker/flex_color_picker.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

Future getCategoryCreation(BuildContext context) {
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
  return showDialog(
      context: context,
      builder: (ctx) {
        String iconSelected = '';
        Color categoryColor = Colors.white;
        bool isExpended = false;

        TextEditingController categoryNamwController = TextEditingController();
        TextEditingController categoryColorController = TextEditingController();
        TextEditingController categoryIconController = TextEditingController();

        bool isLoading = false;
        Category category = Category.empty;


        return BlocProvider.value(
          value: context.read<CreateCategoryBloc>(),
          child: StatefulBuilder(
            builder: (ctx, setState) {
              return BlocListener<CreateCategoryBloc, CreateCategoryState>(
                listener: (context, state) {
                  if (state is CreateCategorySuccess) {
                    Navigator.of(ctx).pop(category);
                  } else if (state is CreateCategoryLoading) {
                    setState(() {
                      isLoading = true;
                    });
                  }
                },
                child: ListView(
                  children: [AlertDialog(
                    title: const Text("Create a category"),
                    content: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        TextFormField(
                          textAlignVertical: TextAlignVertical.center,
                          controller: categoryNamwController,
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            isDense: true,
                            hintText: "Name",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          textAlignVertical: TextAlignVertical.center,
                          readOnly: true,
                          controller: categoryIconController,
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
                              size: 14,
                            ),
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: isExpended
                                  ? const BorderRadius.vertical(
                                      top: Radius.circular(12))
                                  : const BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        isExpended
                            ? Container(
                                width: MediaQuery.of(context).size.width,
                                height: 200,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(12)),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 12, right: 12),
                                  child: GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 30,
                                      crossAxisSpacing: 30,

                                    ),
                                    itemCount: expenseCategories.length,
                                    itemBuilder: (context, int i) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            iconSelected = expenseCategories[i];
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: iconSelected ==
                                                        expenseCategories[i]
                                                    ? Colors.green
                                                    : Colors.grey,
                                                width: 3),
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(12)),
                                          ),

                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Image.asset(
                                                  'assets/${expenseCategories[i]}.png',alignment: Alignment.center,),
                                            ),

                                        ),
                                      );
                                    },
                                  ),
                                ),
                              )
                            : Container(),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          textAlignVertical: TextAlignVertical.center,
                          controller: categoryColorController,
                          readOnly: true,
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (ctx2) {
                                  return AlertDialog(
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ColorPicker(
                                          pickersEnabled: const <ColorPickerType,
                                              bool>{
                                            ColorPickerType.both: false,
                                            ColorPickerType.customSecondary:
                                                false,
                                            ColorPickerType.wheel: true,
                                            ColorPickerType.primary: false,
                                            ColorPickerType.accent: false,
                                          },
                                          onColorChanged: (value) {
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
                                                    borderRadius:
                                                        BorderRadius.circular(12),
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
                          decoration: InputDecoration(
                            fillColor: categoryColor,
                            filled: true,
                            isDense: true,
                            hintText: "Color",
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: isLoading == true
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : TextButton(
                                  onPressed: () {
                                    setState(() {
                                      category.categoryId = const Uuid().v1();
                                      category.color = categoryColor.value;
                                      category.icon = iconSelected;
                                      category.name = categoryNamwController.text;
                                    });
                                    BlocProvider.of<CreateCategoryBloc>(context)
                                        .add(CreateCategory(category: category));
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
                      ]),
                    ),
                  )],
                ),
              );
            },
          ),
        );
      });
}
