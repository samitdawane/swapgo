import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapgo/data/models/login_model.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final loginModel = LoginModel().obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;
  var rememberPassword = false.obs;

  var isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> login() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    formKey.currentState!.save();

    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 2));

    isLoading.value = false;

    Get.snackbar(
      'Success',
      'Login Successful (Dummy API)!',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  Future<void> forgotPassword() async {
    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 2));

    isLoading.value = false;

    Get.snackbar(
      'Success',
      'Forgot Password Email Sent (Dummy API)!',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
