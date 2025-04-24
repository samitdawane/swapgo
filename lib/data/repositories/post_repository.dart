import 'package:swapgo/data/models/Post.dart';

import '../../core/services/api_service.dart';

class PostRepository {
  final ApiService _apiService = ApiService();

  Future<List<Post>> getPosts() async {
    final data = await _apiService.get('/posts');
    return data.map<Post>((json) => Post.fromJson(json)).toList();
  }

  Future<void> addPost(String title, String body) async {
    await _apiService.post('/posts', {
      'title': title,
      'body': body,
    });
  }
}