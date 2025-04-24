import 'package:get/get.dart';
import 'package:swapgo/core/bindings/home_binding.dart';
import 'package:swapgo/core/bindings/login_binding.dart';
import 'package:swapgo/modules/login/login_page.dart';
import 'package:swapgo/modules/posts/home_page.dart';

import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}