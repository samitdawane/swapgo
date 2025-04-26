import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:swapgo/controllers/user_controller.dart';
import 'package:swapgo/core/routes/app_pages.dart';
import 'package:swapgo/core/routes/app_routes.dart';
import 'package:swapgo/modules/registration/registration_controller.dart';


void main  () async {
  final controller =  Get.put(UserController());
  controller.getUserFromBin();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'SwapGo',
      initialRoute: AppRoutes.login,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
