import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:swapgo/modules/login/login_page.dart';
import 'package:swapgo/modules/registration/registration_controller.dart';
import 'package:swapgo/utils/app_constants.dart';
import 'package:swapgo/utils/ui_constants.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});

  final controller = Get.find<RegistrationController>();

  final TextEditingController _fnameController = TextEditingController();
  final TextEditingController _lnameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 45.0,left: 15,right: 15),
          child: SingleChildScrollView(
            child: Obx(() => Column(
              crossAxisAlignment:  CrossAxisAlignment.start,
              children: [
                const Text(
                  AppConstants.CreateAccount,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,

                  ),
                ),
                const Text(AppConstants.CreateAccountSubheader,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 24),
                TextFormField(
                    controller: _fnameController,
                    decoration:  InputDecoration(
                        labelText: AppConstants.FIRST_NAME,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(UIConstants.textfield_corner)),
                        ),
                        errorText: controller.isFirstNameValid.value ? null: 'Please enter first name'),
                    onChanged: (value) {
                      if (value.length > 0) {
                        controller.isFirstNameValid.value = true;
                      }
                    }
                ),

                const SizedBox(height: 16),
                TextFormField(

                    controller: _lnameController,
                    decoration:  InputDecoration(
                        labelText: AppConstants.LAST_NAME,

                        errorText: controller.isLastNameValid.value ? null: 'Please enter last name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(UIConstants.textfield_corner)),
                        )
                    ),
                    onChanged: (value) {
                      if (value.length > 0) {
                        controller.isLastNameValid.value = true;
                      }
                    }
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _mobileController,
                  keyboardType: TextInputType.phone,
                  decoration:  InputDecoration(
                      labelText: AppConstants.MOBILE,
                      errorText: controller.isMobileNoValid.value ? null: 'Please enter mobile number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(UIConstants.textfield_corner)),
                      )
                  ),
                    onChanged: (value) {
                      if (value.length > 0) {
                        controller.isMobileNoValid.value = true;
                      }
                    }

                ),
                const SizedBox(height: 16),
                TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration:  InputDecoration(
                        labelText: AppConstants.EMAIL,
                        errorText: controller.isEmailValid.value ? null: 'Please enter email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(UIConstants.textfield_corner)),
                        )
                    ),
                    onChanged: (value) {
                      if (value.length > 0) {
                        controller.isEmailValid.value = true;
                      }
                    }

                ),
                const SizedBox(height: 16),
                TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration:  InputDecoration(
                        labelText: AppConstants.PASSWORD,
                        errorText: controller.isPasswordValid.value ? null: 'Please enter password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(UIConstants.textfield_corner)),
                        )
                    ),
                    onChanged: (value) {
                      if (value.length > 0) {
                        controller.isPasswordValid.value = true;
                      }
                    }

                ),
                const SizedBox(height: 34),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // rounded corners
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16), // optional: taller button
                    ),
                    onPressed: () {
                      controller.isValidForm(_fnameController.text, _lnameController.text,
                          _mobileController.text, _emailController.text, _passwordController.text);
                    },
                    child: const Text(
                      AppConstants.CreateAccount,

                      style: TextStyle(color: Colors.white, fontSize: 20), // text color
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: (){
                    Get.to(LoginScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Alreaddy have a account? ',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),Text('Login ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ).marginOnly(right: 30),
                    ],
                  ),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}