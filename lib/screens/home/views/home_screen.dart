import 'package:flutter/material.dart';
import 'package:ledgerdiary/screens/add_expense/views/add_expense.dart';
import 'package:ledgerdiary/screens/home/Stats/StatScreen.dart';
import 'package:ledgerdiary/screens/home/views/main_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var widgetList = [
    const MainScreen(),
    const StatScreen()
  ];
  int index =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(),

      body: index==0?const MainScreen():const StatScreen(),
      bottomNavigationBar: ClipRRect(
        borderRadius:
        const BorderRadius.vertical(
            top: Radius.circular(30)
        ),
        child: BottomNavigationBar(
          onTap: (value) {
           setState(() {
             index=value;
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
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddExpense()),
          );
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
  }
}