import 'package:flutter/material.dart';
import 'package:blog_app/services/auth_service.dart';
import 'package:blog_app/storage/session_storage.dart';
import 'package:blog_app/models/user.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  final SessionStorage _session = SessionStorage();

  UserModel? _user;
  String? _token;
  bool _isLoading = false;
  String? _error;

  UserModel? get user => _user;
  String? get token => _token;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isLoggedIn => _token != null;

  /// Initialize: load session if available
  Future<void> initialize() async {
    _token = await _session.getToken();
    if (_token != null) {
      await fetchProfile();
    }
  }

  /// Login
  Future<void> login(String username, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final data = await _authService.loginApi(username, password);
      _token = data['token'];
      await _session.saveToken(_token!);
      await fetchProfile();
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  /// Fetch user profile
  Future<void> fetchProfile() async {
    if (_token == null) return;
    try {
      final data = await _authService.getProfile(_token!);

      // ✅ fix: API ka response map hota hai, string nahi
      _user = UserModel.fromMap(data);
    } catch (e) {
      _error = e.toString();
    }
    notifyListeners();
  }

  /// Logout
  Future<void> logout() async {
    _token = null;
    _user = null;
    await _session.clear();
    notifyListeners();
  }
}
