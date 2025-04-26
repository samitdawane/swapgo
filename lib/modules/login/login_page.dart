import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapgo/modules/login/login_viewmodel.dart';


class LoginPage extends StatelessWidget {
  final controller = Get.find<LoginViewModel>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              //obscureText: true,
            ),
            SizedBox(height: 20),
            Obx(() => controller.isLoading.value
                ? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: () {
                controller.login(
                  emailController.text,
                  passwordController.text,
                );
              },
              child: Text('Login'),
            ))
          ],
        ),
      ),
    );
  }
}