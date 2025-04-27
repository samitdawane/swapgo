import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:swapgo/data/models/master_json_data.dart';
import 'package:swapgo/modules/navbar_tabs/favourite_screen.dart';
import 'package:swapgo/modules/navbar_tabs/home_screen.dart';
import 'package:swapgo/modules/navbar_tabs/profile_screen.dart';
import 'package:swapgo/modules/navbar_tabs/swap_screen.dart';

class MainScreenController extends GetxController {
  // Selected index for BottomNavigationBar
  var selectedIndex = 0.obs;
  final Data userData;

  MainScreenController(this.userData);
  //Rxn<MasterJSONData> userData =

  // List of pages for navigation
  final List<Widget> pages = [
    const HomeScreen(),
    const FavouriteScreen(),
    const SwapScreen(),
    ProfileScreen(),
  ];

  // Method to handle navigation item taps
  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
