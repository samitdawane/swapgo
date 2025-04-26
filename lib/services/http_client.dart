import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpClient {
  static const String baseUrl =
      'http://192.168.0.105:3000/'; // Adjust as needed

  /// GET request
  static Future<dynamic> get(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');

    try {
      final response = await http.get(url);
      return _handleResponse(response);
    } catch (e) {
      throw Exception("GET request error: $e");
    }
  }

  /// POST request with optional body
  static Future<dynamic> post(
    String endpoint, {
    Map<String, dynamic>? body,
  }) async {
    final url = Uri.parse('$baseUrl$endpoint');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception("POST request error: $e");
    }
  }

  /// Handle common response logic
  static dynamic _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('HTTP Error: ${response.statusCode} - ${response.body}');
    }
  }
}
