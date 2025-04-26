import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapgo/core/controllers/personal_details_controller.dart';
import 'package:swapgo/core/common/app_button.dart';
import 'package:swapgo/core/common/app_colors.dart';
import 'package:swapgo/core/common/app_dropdown.dart';
import 'package:swapgo/core/common/app_fontStyles.dart';
import 'package:swapgo/core/common/app_textfield.dart';
import 'package:swapgo/modules/profile_details/profile_icon.dart';

class PersonalDetailsScreen extends StatelessWidget {
  final ProfileDetailsController controller = Get.put(
    ProfileDetailsController(),
  );

  PersonalDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Personal Details',
                  style: AppTextStyle.font26Bold().copyWith(fontSize: 30),
                ),
                const SizedBox(height: 10),
                Text(
                  "Provide your personal details to enhance your Skill Swap experience and connect with like-minded individuals.",
                  style: AppTextStyle.font13Medium().copyWith(height: 1.1),
                ),
                const SizedBox(height: 30),

                /// Occupation
                Obx(
                  () => AppDropdown(
                    label: "Occupation*",
                    value:
                        controller.selectedOccupation.value.isEmpty
                            ? null
                            : controller.selectedOccupation.value,
                    items: controller.occupationList,
                    errorText:
                        controller.occupationError.value.isEmpty
                            ? null
                            : controller.occupationError.value,
                    onChanged: (value) {
                      controller.selectedOccupation.value = value ?? '';
                      controller.occupationError.value = '';
                    },
                  ),
                ),
                const SizedBox(height: 10),

                /// Experience
                Obx(
                  () => AppDropdown(
                    label: "Experience*",
                    value:
                        controller.selectedExperience.value.isEmpty
                            ? null
                            : controller.selectedExperience.value,
                    items: controller.experienceList,
                    errorText:
                        controller.experienceError.value.isEmpty
                            ? null
                            : controller.experienceError.value,
                    onChanged: (value) {
                      controller.selectedExperience.value = value ?? '';
                      controller.experienceError.value = '';
                    },
                  ),
                ),
                const SizedBox(height: 10),

                /// Work Link
                Obx(
                  () => AppTextField(
                    label: "Work Link",
                    hintText: "Ex: LinkedIn Profile URL",
                    controller: controller.workLinkController,
                    errorText: controller.workLinkError.value,
                  ),
                ),

                /// Description
                Obx(
                  () => AppTextField(
                    label: "Description*",
                    hintText: "Add something about yourself...",
                    controller: controller.descriptionController,
                    maxLines: 10,
                    height: 150,
                    isDescription: true,
                    errorText: controller.descriptionError.value,
                    child: Text(
                      "${controller.descriptionCharCount}/250 characters",
                      style: AppTextStyle.font12Regular(),
                    ),
                  ),
                ),

                /// Achievements
                AppTextField(
                  label: "Achievements",
                  hintText: "Add your achievements...",
                  controller: controller.achievementsController,
                  maxLines: 4,
                ),

                const SizedBox(height: 30),

                /// Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                    AppButton(
                      text: 'Next',
                      onPressed: () {
                        final Map<String, dynamic> data = {
                          "occupation": controller.selectedOccupation.value,
                          "experience": controller.selectedExperience.value,
                          "workLink": controller.workLinkController.text,
                          "description": controller.descriptionController.text,
                          "achievements":
                              controller.achievementsController.text,
                        };
                        // if (controller.validateFields()) {
                        Get.to(() => ProfileImageSetter(arguements: data));
                        // }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
