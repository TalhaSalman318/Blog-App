import 'package:blog_app/services/api_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final ApiService _apiService = ApiService();
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  // Login user
  Future<Map<String, dynamic>> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await _apiService.postApiResponse('/auth/login', {
        'username': username,
        'password': password,
      });

      // Save token if login is successful
      if (response.containsKey('token')) {
        await _secureStorage.write(key: 'auth_token', value: response['token']);
      }

      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Register new user
  Future<Map<String, dynamic>> register({
    required String username,
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      final response = await _apiService.postApiResponse('/auth/register', {
        'username': username,
        'email': email,
        'password': password,
        'firstName': firstName,
        'lastName': lastName,
      });

      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Get current user profile
  Future<Map<String, dynamic>> getCurrentUser() async {
    try {
      final token = await _secureStorage.read(key: 'auth_token');
      if (token == null) throw Exception('No token found');

      final response = await _apiService.getApiResponse(
        '/auth/me',
        token: token,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Check if user is logged in
  Future<bool> isLoggedIn() async {
    final token = await _secureStorage.read(key: 'auth_token');
    return token != null;
  }

  // Logout user
  Future<void> logout() async {
    await _secureStorage.delete(key: 'auth_token');
  }

  // Get stored token
  Future<String?> getToken() async {
    return await _secureStorage.read(key: 'auth_token');
  }
}
