import 'package:dynamic_app/pages/account_page.dart';
import 'package:dynamic_app/pages/home_page.dart';
import 'package:dynamic_app/pages/offers.dart';
import 'package:dynamic_app/pages/orders.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int _currentIndex = 0;
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.percent_rounded), label: 'Offers'),
    BottomNavigationBarItem(
      icon: Icon(Icons.menu_book_outlined),
      label: 'Orders',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
  ];

  final List<Widget> _pages = [
    HomePage(),
    OfferPage(),
    OrderPage(),
    AccountPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: _pages[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Icon(Icons.shopping_bag_rounded, color: Colors.red),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.red,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(color: Colors.black),
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black,
        items: items,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
