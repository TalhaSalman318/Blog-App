import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SessionController {
  // constructor
  SessionController._internal();

  // made instance of class
  static final SessionController _instance = SessionController._internal();
  static SessionController get instance => _instance;

  String? userId;
  String? token;
  DateTime? expiryDate;

  void setSession(String userId, String token, DateTime expiryDate) async {
    this.userId = userId;
    this.token = token;
    this.expiryDate = expiryDate;

    // initialize the pacakage
    const FlutterSecureStorage storage = FlutterSecureStorage();

    await storage.write(key: 'userId', value: userId);
    await storage.write(key: 'token', value: token);
    await storage.write(key: 'expiryDate', value: expiryDate.toIso8601String());
  }

  Future<void> loadSession() async {
    const FlutterSecureStorage storage = FlutterSecureStorage();
    final response = await Future.wait([
      storage.read(key: 'userId'),
      storage.read(key: 'token'),
      storage.read(key: 'expiryDate'),
    ]);
    userId = response[0];
    token = response[1];
    String? expiryDateString = response[2];
    if (expiryDateString != null) {
      expiryDate = DateTime.parse(expiryDateString);
    }
  }

  void clearSession() async {
    userId = null;
    token = null;
    expiryDate = null;

    const FlutterSecureStorage storage = FlutterSecureStorage();
    await Future.wait([
      storage.delete(key: 'userId'),
      storage.delete(key: 'token'),
      storage.delete(key: 'expiryDate'),
    ]);
  }
}
