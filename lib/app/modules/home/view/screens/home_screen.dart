import 'package:ecommerce_app_cloud_creative/app/modules/products/view/screen/product_screen.dart';
import 'package:ecommerce_app_cloud_creative/app/modules/search_screen/view/screen/search_screen.dart';
import 'package:ecommerce_app_cloud_creative/app/modules/wishlist/view/screen/wishlist_screen.dart';
import 'package:flutter/material.dart';

import '../../../profile/view/screen/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key); // Pass the key to super

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Screens for bottom navigation
  final List<Widget> _screens = [
    const ProductScreen(),
    const SearchScreen(),
    const WishlistScreen(),
    const ProfileScreen()
  ];

  void onBottomNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: onBottomNavTap,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: "Wishlist"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
