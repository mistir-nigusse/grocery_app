import 'package:flutter/material.dart';
import 'package:grocery_app/views/screens/cart_screen/cart_screen.dart';
import 'package:grocery_app/views/screens/categories_screen/categories_screen.dart';
import 'package:grocery_app/views/screens/favourite_screen/favourite_screen.dart';
import 'package:grocery_app/views/screens/home_screen/home_page.dart';
import 'package:grocery_app/views/screens/profile_screen/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomePage(), // Replace HomeScreen() with the appropriate widget for the Home tab
    CategoriesScreen(),
    CartScreen(),
    FavouriteScreen(),
    ProfileScreen()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange, // Set the color for the active item
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.compare_arrows), label: ""),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: '',
          ),
        ],
      ),
      body: _children[_currentIndex],
    );
  }
}
