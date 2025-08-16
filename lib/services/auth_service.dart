import 'package:blog_app/services/api_service.dart';

class AuthService {
  final ApiService _api = ApiService();

  Future<Map<String, dynamic>> loginApi(
    String username,
    String password,
  ) async {
    final data = await _api.postApiResponse("/auth/login", {
      "username": username,
      "password": password,
    });
    return data;
  }

  Future<Map<String, dynamic>> getProfile(String token) async {
    final data = await _api.getApiResponse(
      "/auth/me",
      headers: {"Authorization": "Bearer $token"},
    );
    return data;
  }

  Future<Map<String, dynamic>> refreshToken(String refreshToken) async {
    final data = await _api.postApiResponse("/auth/refresh", {
      "refreshToken": refreshToken,
    });
    return data;
  }
}
