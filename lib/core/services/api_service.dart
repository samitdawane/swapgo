import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<dynamic>> get(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl$endpoint'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('GET request failed: ${response.body}');
    }
  }

  Future<dynamic> post(String endpoint, Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      body: json.encode(body),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('POST request failed: ${response.body}');
    }
  }
}