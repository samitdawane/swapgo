import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapgo/modules/posts/home_viewmodel.dart';


class HomePage extends StatelessWidget {
  final controller = Get.find<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    controller.fetchPosts();

    return Scaffold(
      appBar: AppBar(title: Text('Posts')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.posts.length,
          itemBuilder: (_, index) {
            final post = controller.posts[index];
            return ListTile(
              title: Text(post.title),
              subtitle: Text(post.body),
            );
          },
        );
      }),
    );
  }
}