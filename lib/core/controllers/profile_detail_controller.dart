import 'package:get/get.dart';

class ProfileController extends GetxController {
  // Reactive variables to hold user data
  var userName = 'John Doe'.obs;
  var email = 'johndoe@example.com'.obs;
  var profilePicture = 'assets/profile.jpg'.obs; // You can change this to a URL or asset path

  // Method to update the profile data
  void updateProfile(String name, String userEmail, String picture) {
    userName.value = name;
    email.value = userEmail;
    profilePicture.value = picture;
  }
}