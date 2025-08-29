import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/auth_service.dart';
import '../storage/session_storage.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  final SessionController _sessionStorage = SessionController();

  UsersItem? _user;
  bool _isLoading = false;

  UsersItem? get user => _user;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _user != null;

  get error => null;

  Future<void> loadUserFromStorage() async {
    await _sessionStorage.getToken();
    notifyListeners();
  }

  Future<void> login(String username, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final loggedInUser = await _authService.login(username, password);
      _user = loggedInUser;
      await _sessionStorage.saveToken(loggedInUser!.token ?? '');
      notifyListeners();
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _user = null;
    await _sessionStorage.deleteToken();
    notifyListeners();
  }
}
