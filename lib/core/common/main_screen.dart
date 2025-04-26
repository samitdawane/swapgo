import 'package:flutter/material.dart';
import 'package:swapgo/core/common/app_bottom_bar.dart';

import 'package:swapgo/modules/navbar_tabs/favourite_screen.dart';
import 'package:swapgo/modules/navbar_tabs/home_screen.dart';
import 'package:swapgo/modules/navbar_tabs/profile_screen.dart';
import 'package:swapgo/modules/navbar_tabs/swap_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    FavouriteScreen(),
    SwapScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
