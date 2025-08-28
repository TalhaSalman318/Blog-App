import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class AuthService {
  static const baseUrl = "https://dummyjson.com";

  Future<UsersItem?> login(String username, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/users"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"username": username, "password": password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return UsersItem.fromJson(data);
    } else {
      throw Exception("Login failed: ${response.body}");
    }
  }
}
