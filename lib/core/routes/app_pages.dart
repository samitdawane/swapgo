import 'package:get/get.dart';
import 'package:swapgo/core/bindings/home_binding.dart';
import 'package:swapgo/modules/posts/home_page.dart';
import 'package:swapgo/modules/profile_details.dart';

import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.login,
      page: () => PersonalDetailsScreen(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.skills,
      page: () => SkillSelectionScreen(),
      binding: SkillBinding(),
    ),
  ];
}
