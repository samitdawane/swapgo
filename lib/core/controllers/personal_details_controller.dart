import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileDetailsController extends GetxController {
  // TextEditingControllers
  final occupationController = TextEditingController();
  final experienceController = TextEditingController();
  final workLinkController = TextEditingController();
  final descriptionController = TextEditingController();
  final achievementsController = TextEditingController();

  // Error messages
  // final RxnString occupationError = RxnString();
  // final RxnString experienceError = RxnString();
  final RxnString workLinkError = RxnString();
  final RxnString descriptionError = RxnString();
  final RxnString achievementsError = RxnString();

  // Character count for description
  final RxInt descriptionCharCount = 0.obs;
  final int maxDescriptionLength = 250;

  @override
  void onInit() {
    super.onInit();

    workLinkController.addListener(() {
      if (workLinkError.value != null && workLinkController.text.isNotEmpty) {
        workLinkError.value = null;
      }
    });

    achievementsController.addListener(() {
      if (achievementsError.value != null &&
          achievementsController.text.isNotEmpty) {
        achievementsError.value = null;
      }
    });

    descriptionController.addListener(() {
      if (descriptionError.value != null &&
          descriptionController.text.isNotEmpty) {
        descriptionError.value = null;
      }
      _updateCharCount();
    });
    achievementsController.addListener(() {
      if (achievementsError.value != null &&
          achievementsController.text.isNotEmpty) {
        achievementsError.value = null;
      }
      _updateCharCount();
    });
  }

  final RxString selectedOccupation = ''.obs;
  final RxString selectedExperience = ''.obs;

  final RxString occupationError = ''.obs;
  final RxString experienceError = ''.obs;

  List<String> occupationList = [
    'Technology & IT',
    'Finance & Accounting',
    'Healthcare & Medicine',
    'Business & Management',
    'Creative & Design',
    'Education & Training',
    'Legal & Law',
    'Sales & Marketing',
    'Engineering & Manufacturing',
    'Human Resources & Administration',
    'Agriculture & Environmental',
    'Logistics & Transportation',
    'Food & Hospitality',
    'Skilled Trades',
    'Entertainment & Media',
    'Retail & Customer Service',
    'Beauty & Personal Care',
    'Energy & Utilities',
    'Gaming & Interactive Media',
    'Animal Care & Veterinary',
    'Culinary Arts & Food Services',
    'Sustainability & Green Jobs',
    'Freelancing & Independent Work',
    'Tourism & Travel',
    'Real Estate & Property Management',
    'Automotive & Transportation',
    'Science & Research',
    'Government & Public Sector',
  ];

  List<String> experienceList = [
    '0-3',
    '3-6',
    '6-9',
    '9-12',
    '12-15',
    '15-18',
    '18-20',
    '20+',
  ];

  void _updateCharCount() {
    if (descriptionController.text.length > maxDescriptionLength) {
      descriptionController.text = descriptionController.text.substring(
        0,
        maxDescriptionLength,
      );
      descriptionController.selection = TextSelection.fromPosition(
        TextPosition(offset: descriptionController.text.length),
      );
    }
    descriptionCharCount.value = descriptionController.text.length;
  }

  bool validateFields() {
    bool isValid = true;
    if (selectedOccupation.value.isEmpty) {
      occupationError.value = "Occupation is required";
      isValid = false;
    }

    if (selectedExperience.value.isEmpty) {
      experienceError.value = "Experience is required";
      isValid = false;
    }
    if (descriptionController.text.isEmpty) {
      descriptionError.value = "Description is required";
      isValid = false;
    }
    if (workLinkController.text.isNotEmpty) {
      workLinkController.text.contains('@')
          ? workLinkError.value = null
          : workLinkError.value = "Invalid URL";
      isValid = false;
    }

    return isValid;
  }

  @override
  void onClose() {
    occupationController.dispose();
    experienceController.dispose();
    workLinkController.dispose();
    descriptionController.dispose();
    achievementsController.dispose();
    super.onClose();
  }
}
