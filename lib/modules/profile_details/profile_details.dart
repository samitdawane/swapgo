import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapgo/controllers/user_controller.dart';
import 'package:swapgo/core/controllers/personal_details_controller.dart';
import 'package:swapgo/core/common/app_button.dart';
import 'package:swapgo/core/common/app_colors.dart';
import 'package:swapgo/core/common/app_dropdown.dart';
import 'package:swapgo/core/common/app_fontStyles.dart';
import 'package:swapgo/core/common/app_textfield.dart';
import 'package:swapgo/core/routes/app_routes.dart';
import 'package:swapgo/modules/profile_details/profile_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapgo/controllers/user_controller.dart';
import 'package:swapgo/core/common/app_colors.dart';
import 'package:swapgo/core/common/app_fontStyles.dart';
import 'package:swapgo/modules/profession/profession_search.dart';
import 'package:swapgo/core/common/custom_appbar.dart';

class UserDetailsScreen extends StatelessWidget {
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    final user = userController.loginUserData.value.data;

    return Scaffold(
      appBar: CustomAppBar(
        title: "User Details",
        onSearchTap: () {
          Get.to(() => const ProfessionSearchScreen());
        },
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child:
            user == null
                ? Center(child: Text('No user data'))
                : SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 10),
                          ],
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 16),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                'assets/profile_avatar/${user.avatarwithinterest?.first.imgLink}',
                                width: 105,
                                height: 85,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              '${user.fname ?? ''} ${user.lname ?? ''}',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.favorite_border, size: 18),
                                Text(
                                  '${user.reviewandrating?.first.rating ?? "0"}K+',
                                ),
                                const SizedBox(width: 8),
                                Icon(Icons.brightness_1, size: 6),
                                const SizedBox(width: 8),
                                const Icon(Icons.swap_horiz, size: 18),
                                const SizedBox(width: 8),
                                Text('60+'), // or your swap count here
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _button(
                                  "Go for Premium",
                                  Colors.brown,
                                  Colors.white,
                                ),
                                const SizedBox(width: 8),
                                _button(
                                  "Edit",
                                  Colors.grey[300]!,
                                  Colors.black,
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            _sectionTitle("About"),
                            _aboutRow(Icons.phone, user.mobileNo ?? ''),
                            _aboutRow(Icons.message, user.email ?? ''),
                            _aboutRow(
                              Icons.link,
                              'https://www.linkedin.com/feed/${user.fname}',
                            ),
                            const SizedBox(height: 24),
                            _sectionTitle("Description"),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Text(
                                user.personaldetails?.first.description ??
                                    'No description available',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            const SizedBox(height: 24),
                            _sectionTitle("Interests"),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Text(
                                user.avatarwithinterest?.first.interest ??
                                    'No interest mentioned',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      AppButton(text: "Logout", onPressed: () {}),
                      // SizedBox(
                      //   height: 20,
                      //   wz
                      //   child: ElevatedButton(

                      //     onPressed: () {
                      //       // handle logout action here
                      //     },
                      //     style: ElevatedButton.styleFrom(
                      //       backgroundColor: Colors.brown,
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(10),
                      //       ),
                      //       padding: const EdgeInsets.symmetric(vertical: 14),
                      //     ),
                      //     child: Text(
                      //       "LOGOUT",
                      //       style: TextStyle(
                      //         color: Colors.white,
                      //         fontSize: 16,
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
      ),
    );
  }

  Widget _button(String text, Color color, Color textColor) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Text(text, style: TextStyle(color: textColor)),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 4),
          Icon(Icons.info_outline, size: 16),
        ],
      ),
    );
  }

  Widget _aboutRow(IconData icon, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 18),
          const SizedBox(width: 8),
          Expanded(child: Text(value, style: TextStyle(fontSize: 14))),
        ],
      ),
    );
  }
}
