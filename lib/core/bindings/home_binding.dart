import 'package:get/get.dart';
import 'package:swapgo/modules/posts/home_viewmodel.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeViewModel>(() => HomeViewModel());
  }
}