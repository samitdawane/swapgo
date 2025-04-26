import 'package:get/get.dart';

class AvatarController extends GetxController {
  RxString selectedAvatar = ''.obs;

  void selectAvatar(String avatar) {
    selectedAvatar.value = avatar;
  }
}
