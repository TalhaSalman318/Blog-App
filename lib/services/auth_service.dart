import 'dart:convert';
import 'package:blog_app/models/user.dart';
import 'package:blog_app/models/user_post_model.dart';
import 'package:blog_app/services/api_service.dart';
import 'package:blog_app/storage/session_storage.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final String loginUrl = "https://dummyjson.com/auth/login";
  final String meUrl = "https://dummyjson.com/auth/me";
  final String userUrl = "https://dummyjson.com/users";
  static String userPosts(int userId) =>
      "https://dummyjson.com/users/$userId/posts";

  Future<Users?> login(String username, String password) async {
    final url = Uri.parse(loginUrl);
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"username": username, "password": password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final accessToken = data["accessToken"];
      await SessionStorage().saveToken(accessToken);
      return Users.fromJson(data);
    }
    return null;
  }

  Future<Users?> getProfile() async {
    final token = await SessionStorage().getToken(); // ✅ fixed await
    if (token == null) return null;

    final url = Uri.parse(meUrl);
    final response = await http.get(
      url,
      headers: {"Authorization": "Bearer $token"},
    );
    if (response.statusCode == 200) {
      return Users.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  Future<void> logout() async {
    await SessionStorage().deleteToken();
  }

  Future<UserPostModel> getUserPosts(int userId, String token) async {
    final url = Uri.parse(userPosts(userId));
    final response = await http.get(
      url,
      headers: {"Authorization": "Bearer $token"},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return UserPostModel.fromJson(data); // whole object parsed once
    } else {
      throw Exception("Failed to load user posts");
    }
  }

  Future<String?> getToken() async {
    return await SessionStorage().getToken();
  }

  // Optional: If you want a method to get the token immediately after login
  Future<String?> getProfileToken() async {
    final token = await SessionStorage().getToken();
    return token;
  }
}
