import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapgo/core/common/app_button.dart';
import 'package:swapgo/core/common/app_colors.dart';
import 'package:swapgo/core/common/app_fontStyles.dart';
import 'package:swapgo/core/common/app_images.dart';

import 'package:swapgo/core/controllers/avatar_controller.dart'; // Import your controller

class ProfileImageSetter extends StatelessWidget {
  final Map<String, dynamic>? arguements;
  ProfileImageSetter({super.key, this.arguements});

  final AvatarController controller = Get.put(AvatarController());

  final List<String> avatars = [
    AppImages.avatar1,
    AppImages.avatar2,
    AppImages.avatar3,
    AppImages.avatar4,
    AppImages.avatar5,
    AppImages.avatar6,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select an Avatar',
                style: AppTextStyle.font26Bold().copyWith(fontSize: 30),
              ),
              const SizedBox(height: 10),
              Text(
                "Avatar speaks louder than words! Choose the perfect avatar for your profile.",
                style: AppTextStyle.font13Medium().copyWith(height: 1.1),
              ),
              const SizedBox(height: 30),

              // Avatar Grid
              Expanded(
                child: GridView.builder(
                  itemCount: avatars.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    final avatar = avatars[index];
                    return Obx(
                      () => GestureDetector(
                        onTap: () {
                          controller.selectAvatar(avatar);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color:
                                  controller.selectedAvatar.value == avatar
                                      ? Colors.green
                                      : Colors.black,
                              width:
                                  controller.selectedAvatar.value == avatar
                                      ? 3
                                      : 2,
                            ),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: ClipOval(
                            child: Image.asset(avatar, fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Save Button
              SizedBox(
                width: double.infinity,
                child: AppButton(
                  text: 'Done',
                  onPressed: () {
                    if (controller.selectedAvatar.value.isNotEmpty) {
                      String fullPath = controller.selectedAvatar.value;
                      String fileName =
                          fullPath.split('/').last; // 👈 Get only avatar1.jpeg

                      Map<String, dynamic> payload = {
                        "avatar": fileName,
                        "occupation": arguements!["occupation"],
                        "experience": arguements!["experience"],
                        "workLink": arguements!["workLink"],
                        "description": arguements!["description"],
                        "achievements": arguements!["achievements"],
                      };
                    } else {
                      Get.snackbar(
                        'Error',
                        "Please select an avatar",
                        colorText: AppColors.textBlackColor,
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.red.withValues(alpha: 0.6),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
