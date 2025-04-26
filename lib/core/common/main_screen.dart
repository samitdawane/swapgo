import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapgo/core/common/app_bottom_bar.dart';
import 'package:swapgo/core/controllers/main_screen_controller.dart';
import 'package:swapgo/data/models/master_json_data.dart';

import 'package:swapgo/modules/navbar_tabs/favourite_screen.dart';
import 'package:swapgo/modules/navbar_tabs/home_screen.dart';
import 'package:swapgo/modules/navbar_tabs/profile_screen.dart';
import 'package:swapgo/modules/navbar_tabs/swap_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Make sure to import BottomNavBar

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    MasterJSONData user = Get.arguments;
    final MainScreenController controller = Get.put(MainScreenController());

    return Scaffold(
      body: Obx(() {
        return controller.pages[controller.selectedIndex.value];
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavBar(
          selectedIndex: controller.selectedIndex.value,
          onItemTapped: controller.onItemTapped,
        );
      }),
    );
  }
}
