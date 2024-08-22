import 'package:dog_api_project/Pages/cart_page.dart';
import 'package:dog_api_project/Pages/history_page.dart';
import 'package:dog_api_project/Pages/home_page.dart';
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationState();
}

class _NavigationState extends State<NavigationPage> {
  // DateTime timeBackPressed = DateTime.now();
  int selectedScreen = 0;
  List<Widget> screens = [
    const HomePage(),
    const CartPage(),
    const HistoryPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blueAccent,
      body: screens.elementAt(selectedScreen),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blue,
          currentIndex: selectedScreen,
          type: BottomNavigationBarType.fixed,
          // elevation: 20,
          onTap: (value) {
            setState(() {
              selectedScreen = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: "History")
          ]),
    );
  }
}
