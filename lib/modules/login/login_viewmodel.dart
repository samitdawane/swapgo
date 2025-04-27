import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';
import '../../../data/repositories/auth_repository.dart';

class LoginViewModel extends GetxController {
  final AuthRepository _repository = AuthRepository();
  var isLoading = false.obs;



  Future<void> login(String email, String password) async {
    isLoading.value = true;
    try {
      bool success = await _repository.login(email, password);
      if (success) {
        Get.offAllNamed(AppRoutes.home);
      } else {
        Get.snackbar("Login Failed", "Invalid credentials");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}