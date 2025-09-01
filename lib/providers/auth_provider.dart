import 'package:blog_app/models/user.dart';
import 'package:blog_app/services/auth_service.dart';
import 'package:blog_app/storage/session_storage.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();

  Users? _user;
  Users? get user => _user;

  bool _startupLoading = true; // ✅ Only for app init
  bool get startupLoading => _startupLoading;

  bool _authLoading = false; // ✅ Only for login/logout
  bool get authLoading => _authLoading;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  String? _token;
  String? get token => _token;

  AuthProvider() {
    loadUserFromStorage(); // check token on start
  }

  Future<void> loadUserFromStorage() async {
    _startupLoading = true;
    notifyListeners();
    _token = await SessionStorage().getToken();
    if (_token != null) {
      _user = await _authService.getProfile();
    }
    _startupLoading = false;
    notifyListeners();
  }

  Future<void> login(String username, String password) async {
    _authLoading = true;
    _error = null;
    notifyListeners();

    try {
      final user = await _authService.login(username, password);
      if (user != null) {
        _user = user;
        _token = await SessionStorage().getToken();

        // ✅ save token in storage
        await SessionStorage().saveToken(_token!);
      } else {
        _error = "Invalid username or password";
      }
    } catch (e) {
      _error = e.toString();
    }

    _authLoading = false;
    notifyListeners();
  }

  Future<void> logout() async {
    await _authService.logout();
    await SessionStorage().deleteToken(); // ✅ remove token from storage
    _user = null;
    _token = null;
    notifyListeners();
  }
}
