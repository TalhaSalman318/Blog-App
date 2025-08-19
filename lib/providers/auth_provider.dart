import 'package:flutter/material.dart';
import 'package:blog_app/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService;

  AuthProvider({required AuthService authService}) : _authService = authService;

  // State variables
  bool _isLoading = false;
  String? _error;
  Map<String, dynamic>? _currentUser;

  // Getters
  bool get isLoading => _isLoading;
  String? get error => _error;
  Map<String, dynamic>? get currentUser => _currentUser;

  // Login method
  Future<bool> login(String username, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await _authService.login(
        username: username,
        password: password,
      );

      // Fetch user profile after successful login
      if (response.containsKey('token')) {
        final userProfile = await _authService.getCurrentUser();
        _currentUser = userProfile;
      }

      return true;
    } catch (e) {
      _error = e.toString();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Auto-login using existing token
  Future<bool> tryAutoLogin() async {
    _isLoading = true;
    notifyListeners();

    try {
      if (await _authService.isLoggedIn()) {
        _currentUser = await _authService.getCurrentUser();
        return true;
      }
      return false;
    } catch (e) {
      await _authService.logout();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Logout method
  Future<void> logout() async {
    await _authService.logout();
    _currentUser = null;
    notifyListeners();
  }

  // Registration method
  Future<bool> register({
    required String username,
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await _authService.register(
        username: username,
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
      );

      // Auto-login after registration if needed
      if (response.containsKey('id')) {
        return await login(username, password);
      }
      return false;
    } catch (e) {
      _error = e.toString();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
