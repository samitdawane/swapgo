import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class SkillBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SkillBinding>(() => SkillBinding());
  }
}
