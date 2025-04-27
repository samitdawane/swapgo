import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapgo/core/common/app_bottom_bar.dart';
import 'package:swapgo/core/controllers/main_screen_controller.dart';
import 'package:swapgo/data/models/master_json_data.dart';
// Make sure to import BottomNavBar

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    Data? user = Get.arguments;
    final MainScreenController controller = Get.put(
      MainScreenController(user ?? Data()),
    );

    // controller.userData.value = user;
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
