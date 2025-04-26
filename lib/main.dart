import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:swapgo/core/routes/app_pages.dart';
import 'package:swapgo/core/routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX MVP App',
      initialRoute: AppRoutes.login,
      getPages: AppPages.routes,
    );
  }
}
