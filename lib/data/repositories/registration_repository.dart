import 'package:swapgo/core/services/api_service.dart';

class RegistrationRepository {
  final ApiService _apiService = ApiService();


  Future<dynamic> callRegistrationAPI(Map<String, String> params)async {
    final response = await _apiService.post('/registration', params);
    return response;
  }


}