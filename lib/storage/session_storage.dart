import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SessionStorage {
  static const _storage = FlutterSecureStorage();
  static const _keyToken = 'token';
  static const _keyUserId = 'userId';

  // Save token & user ID after login
  static Future<void> saveSession(String token, String userId) async {
    await _storage.write(key: _keyToken, value: token);
    await _storage.write(key: _keyUserId, value: userId);
  }

  // Retrieve token & user ID
  static Future<Map<String, String?>> getSession() async {
    final token = await _storage.read(key: _keyToken);
    final userId = await _storage.read(key: _keyUserId);
    return {'token': token, 'userId': userId};
  }

  // Clear storage on logout
  static Future<void> clearSession() async {
    await _storage.delete(key: _keyToken);
    await _storage.delete(key: _keyUserId);
  }
}
