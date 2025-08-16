import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://dummyjson.com";

  Future<dynamic> getApiResponse(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    final response = await http.get(
      Uri.parse("$baseUrl$endpoint"),
      headers: headers,
    );
    return _handleResponse(response);
  }

  Future<dynamic> postApiResponse(
    String endpoint,
    Map<String, dynamic> body, {
    Map<String, String>? headers,
  }) async {
    final response = await http.post(
      Uri.parse("$baseUrl$endpoint"),
      headers: headers ?? {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
    return _handleResponse(response);
  }

  Future<dynamic> updateApiResponse(
    String endpoint,
    Map<String, dynamic> body, {
    Map<String, String>? headers,
  }) async {
    final response = await http.put(
      Uri.parse("$baseUrl$endpoint"),
      headers: headers ?? {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
    return _handleResponse(response);
  }

  Future<dynamic> deleteApiResponse(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    final response = await http.delete(
      Uri.parse("$baseUrl$endpoint"),
      headers: headers,
    );
    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      throw Exception("API Error: ${response.statusCode} - ${response.body}");
    }
  }
}
