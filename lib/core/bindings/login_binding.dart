import 'package:get/get.dart';
import 'package:swapgo/modules/login/login_viewmodel.dart';


class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginViewModel>(() => LoginViewModel());
  }
}