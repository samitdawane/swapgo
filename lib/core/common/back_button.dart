import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: Colors.white,
      child: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Get.back();
        },
      ),
    );
  }
}
