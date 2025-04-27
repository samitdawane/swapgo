import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapgo/controllers/user_controller.dart';
import 'package:swapgo/core/common/app_colors.dart';
import 'package:swapgo/core/common/main_screen.dart';
import 'package:swapgo/core/controllers/login_controller.dart';
import 'package:swapgo/data/models/master_json_data.dart';
import 'package:swapgo/modules/profile_details/profile_details.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController controller = Get.put(LoginController());
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        'Hi ,Welcome Back! 👋',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textBlackColor,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Hello again. You have been missed!',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textGreyColor,
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'Email',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: controller.emailController,
                        decoration: InputDecoration(
                          hintText: 'Email, phone & username',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your email or phone or username';
                          }
                          return null;
                        },

                        onSaved:
                            (value) => controller.loginModel.update((model) {
                              model?.email = value ?? '';
                            }),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Password',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Obx(
                        () => TextField(
                          controller: controller.passwordController,
                          obscureText: !controller.isPasswordVisible.value,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.isPasswordVisible.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: controller.togglePasswordVisibility,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Obx(
                            () => Checkbox(
                              value: controller.rememberPassword.value,
                              activeColor: AppColors.checkboxActiveColor,
                              onChanged: (value) {
                                controller.rememberPassword.value =
                                    value ?? false;
                              },
                            ),
                          ),
                          const Text('Remember Password'),
                          const Spacer(),
                          GestureDetector(
                            onTap: () => controller.forgotPassword(),
                            child: const Text(
                              'Forgot Password ?',
                              style: TextStyle(
                                color: AppColors.textRedColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Obx(
                        () =>
                            controller.isLoading.value
                                ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                                : SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          AppColors
                                              .primaryColor, // Button background
                                      foregroundColor:
                                          Colors.white, // Text/Icon color
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    //onPressed: () => controller.login(),
                                    onPressed: () async {
                                      MasterJSONData? userData =
                                          await userController.checkUserlogin(
                                            controller.emailController.text,
                                            controller.passwordController.text,
                                          );

                                      if (userData?.data != null) {
                                        Get.offAll(
                                          MainScreen(),
                                          arguments: userData?.data,
                                        );
                                      } else {
                                        print(
                                          "Mobile Number or Password invalid",
                                        );
                                        Get.snackbar(
                                          'Error',
                                          'Mobile Number or Password invalid',
                                          backgroundColor: Colors.red,
                                        );
                                      }
                                    },

                                    child: const Text(
                                      'LOGIN',
                                      style: TextStyle(
                                        color:
                                            Colors
                                                .white, // (extra safe - you can also remove this because foregroundColor already handles it)
                                      ),
                                    ),
                                  ),
                                ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: const [
                          Expanded(
                            child: Divider(color: AppColors.dividerColor),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text('or'),
                          ),
                          Expanded(
                            child: Divider(color: AppColors.dividerColor),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.g_mobiledata, size: 40, color: Colors.red),
                          SizedBox(width: 20),
                          Icon(Icons.facebook, size: 30, color: Colors.blue),
                          SizedBox(width: 20),
                          Icon(Icons.apple, size: 30, color: Colors.black),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
