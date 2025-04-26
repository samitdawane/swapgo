import 'package:get/get.dart';
import 'package:swapgo/modules/login/login_viewmodel.dart';
import 'package:swapgo/modules/registration/registration_controller.dart';


class RegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistrationController>(() => RegistrationController());
  }
}