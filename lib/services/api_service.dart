import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://dummyjson.com";

  // --- GET
  Future<dynamic> getApiResponse(
    String endpoint, {
    Map<String, String>? query,
  }) async {
    final uri = Uri.parse("$baseUrl$endpoint").replace(queryParameters: query);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("GET error: ${response.statusCode}");
    }
  }

  // --- POST
  Future<dynamic> postApiResponse(
    String endpoint,
    Map<String, dynamic> body,
  ) async {
    final uri = Uri.parse("$baseUrl$endpoint");
    final response = await http.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception("POST error: ${response.statusCode}");
    }
  }

  // --- PUT
  Future<dynamic> putApiResponse(
    String endpoint,
    Map<String, dynamic> body,
  ) async {
    final uri = Uri.parse("$baseUrl$endpoint");
    final response = await http.put(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("PUT error: ${response.statusCode}");
    }
  }

  // --- DELETE
  Future<dynamic> deleteApiResponse(String endpoint) async {
    final uri = Uri.parse("$baseUrl$endpoint");
    final response = await http.delete(uri);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("DELETE error: ${response.statusCode}");
    }
  }
}
