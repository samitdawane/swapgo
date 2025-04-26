import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapgo/core/common/app_colors.dart';
import 'package:swapgo/core/controllers/skill_controller.dart';
import 'package:swapgo/data/models/skill_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SkillSelectionScreen extends StatelessWidget {
  final SkillController controller = Get.put(SkillController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.backgroundColor,

        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Select Your Skills'),
              // Category dropdown menu
              Obx(() {
                return DropdownButton<String>(
                  value:
                      controller.selectedCategory.value.isNotEmpty
                          ? controller.selectedCategory.value
                          : null, // Default value
                  hint: const Text("Select Category"),
                  isExpanded: true,
                  onChanged: (newValue) {
                    if (newValue != null) {
                      controller.selectCategory(newValue);
                    }
                  },
                  items:
                      controller.categories.map((category) {
                        return DropdownMenuItem<String>(
                          value: category.categoryName,
                          child: Text(
                            category.categoryName,
                            style: const TextStyle(fontSize: 16),
                          ),
                        );
                      }).toList(),
                );
              }),
              const SizedBox(height: 20),

              // Display skills for selected category
              Obx(() {
                final selectedCategory = controller.selectedCategory.value;
                final category = controller.categories.firstWhere(
                  (cat) => cat.categoryName == selectedCategory,
                  orElse: () => SkillCategory(categoryName: '', skills: []),
                );

                return selectedCategory.isNotEmpty
                    ? Wrap(
                      spacing: 8.0, // Horizontal space between skills
                      runSpacing: 4.0, // Vertical space between lines
                      children:
                          category.skills.map((skill) {
                            return Obx(
                              () => ChoiceChip(
                                label: Text(skill),
                                selected: controller.selectedSkills.contains(
                                  skill,
                                ),
                                selectedColor: AppColors.primaryColor,
                                onSelected:
                                    (_) => controller.toggleSkill(skill),
                                labelStyle: TextStyle(
                                  color:
                                      controller.selectedSkills.contains(skill)
                                          ? Colors.white
                                          : Colors.black,
                                ),
                                backgroundColor: Colors.grey[200],
                              ),
                            );
                          }).toList(),
                    )
                    : Container(); // Empty container if no category is selected
              }),

              const SizedBox(height: 20),

              // Display selected skills at the bottom
              const Text(
                "Selected Skills:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Obx(() {
                final selectedSkills = controller.selectedSkills;
                return selectedSkills.isNotEmpty
                    ? Wrap(
                      spacing: 8.0,
                      runSpacing: 4.0,
                      children:
                          selectedSkills.map((skill) {
                            return Chip(
                              label: Text(skill),
                              backgroundColor: AppColors.primaryColor,
                              labelStyle: const TextStyle(color: Colors.white),
                            );
                          }).toList(),
                    )
                    : const Text("No skills selected");
              }),

              const SizedBox(height: 20),
              Spacer(),
              // Buttons Row
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed:
                          controller.selectedSkills.isEmpty
                              ? null // Disable if no skills selected
                              : () {
                                _submitSkills();
                              },
                      child: const Text('Submit'),
                      style: ElevatedButton.styleFrom(
                        // primary: AppColors.primaryColor, // Submit button color
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10), // Space between Submit and Reset
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        controller.clearSelectedSkills();
                      },
                      child: const Text('Reset'),
                      style: ElevatedButton.styleFrom(
                        // primary: Colors.redAccent, // Reset button color
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Handle API call to submit the skills
  void _submitSkills() {
    final RxSet<String> selectedSkills =
        Get.find<SkillController>().selectedSkills;

    // Create the payload for the API request
    final Map<String, dynamic> payload = {'skills': selectedSkills};

    // Simulating the API call (replace with your actual API call)
    // Example:
    // YourAPIService.submitSkills(payload).then((response) {
    //   if (response.isSuccessful) {
    //     // Handle success
    //     Get.snackbar('Success', 'Skills submitted successfully');
    //   } else {
    //     // Handle failure
    //     Get.snackbar('Error', 'Failed to submit skills');
    //   }
    // });

    // Just for demonstration
    print('Submitting skills: $selectedSkills');
    Get.snackbar('Success', 'Skills submitted successfully');
  }
}
