import 'package:swapgo/core/services/api_service.dart';

class AuthRepository {
  final ApiService _apiService = ApiService();

 /* Future<bool> login(String email, String password) async {
    final response = await _apiService.post('/login', {
      'email': email,
      'password': password,
    });
    return response != null;
  }*/

  Future<bool> login(String email, String password) async {
    // Demo: Accept only one user
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay
    return email == "samit@gmail.com" && password == "123456";
  }
}