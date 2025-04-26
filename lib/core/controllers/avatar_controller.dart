import 'package:get/get.dart';

class AvatarController extends GetxController {
  var selectedAvatar = ''.obs;

  void selectAvatar(String avatar) {
    selectedAvatar.value = avatar;
  }

  // 👇 New Part
  var interests =
      [
        'Technology',
        'Travel',
        'Fitness',
        'Music',
        'Art',
        'Cooking',
        'Gaming',
        'Photography',
        'Sports',
        'Reading',
      ].obs;

  var selectedInterests = <String>[].obs;

  void toggleInterest(String interest) {
    if (selectedInterests.contains(interest)) {
      selectedInterests.remove(interest);
    } else {
      selectedInterests.add(interest);
    }
  }
}
