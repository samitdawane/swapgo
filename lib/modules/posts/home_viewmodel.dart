import 'package:get/get.dart';
import 'package:swapgo/data/models/Post.dart';
import '../../../data/repositories/post_repository.dart';

class HomeViewModel extends GetxController {
  final PostRepository _repository = PostRepository();
  var posts = <Post>[].obs;
  var isLoading = false.obs;

  void fetchPosts() async {
    isLoading.value = true;
    try {
      posts.value = await _repository.getPosts();
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void createPost(String title, String body) async {
    await _repository.addPost(title, body);
    fetchPosts();
  }
}