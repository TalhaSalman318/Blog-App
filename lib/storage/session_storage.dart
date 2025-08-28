// session_controller.dart
import 'dart:convert';
import 'package:blog_app/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SessionController {
  SessionController._internal();
  static final SessionController _instance = SessionController._internal();
  static SessionController get instance => _instance;

  UsersItem? currentUser;
  String? token;
  DateTime? expiryDate;

  bool get isSessionActive {
    if (token == null || expiryDate == null) return false;
    return DateTime.now().isBefore(expiryDate!);
  }

  Future<void> setSession(UsersItem user) async {
    currentUser = user;
    token = user.token; // 🔥 token user se lo
    expiryDate = DateTime.now().add(
      Duration(days: 7),
    ); // 🔥 ya API ka date use karo

    const storage = FlutterSecureStorage();
    await storage.write(key: 'user', value: jsonEncode(user.toJson()));
    await storage.write(key: 'token', value: token);
    await storage.write(
      key: 'expiryDate',
      value: expiryDate!.toIso8601String(),
    );
  }

  Future<void> loadSession() async {
    const storage = FlutterSecureStorage();
    final data = await Future.wait([
      storage.read(key: 'user'),
      storage.read(key: 'token'),
      storage.read(key: 'expiryDate'),
    ]);

    if (data[0] != null) {
      currentUser = UsersItem.fromJson(jsonDecode(data[0]!));
    }
    token = data[1];
    if (data[2] != null) {
      expiryDate = DateTime.parse(data[2]!);
    }
  }

  Future<void> clearSession() async {
    currentUser = null;
    token = null;
    expiryDate = null;

    const storage = FlutterSecureStorage();
    await storage.deleteAll();
  }
}



// Tech Brother Code 

// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class SessionController {
//   // constructor
//   SessionController._internal();

//   // made instance of class
//   static final SessionController _instance = SessionController._internal();
//   static SessionController get instance => _instance;

//   String? userId;
//   String? token;
//   DateTime? expiryDate;

//   bool get isSessionActive{
//     if(token == null || expiryDate == null) return false;
//     return DateTime.now().isBefore(expiryDate!);
//   }

//   void setSession(String userId, String token, DateTime expiryDate) async {
//     this.userId = userId;
//     this.token = token;
//     this.expiryDate = expiryDate;

//     // initialize the pacakage
//     const FlutterSecureStorage storage = FlutterSecureStorage();

//     await storage.write(key: 'userId', value: userId);
//     await storage.write(key: 'token', value: token);
//     await storage.write(key: 'expiryDate', value: expiryDate.toIso8601String());
//   }

//   Future<void> loadSession() async {
//     const FlutterSecureStorage storage = FlutterSecureStorage();
//     final response = await Future.wait([
//       storage.read(key: 'userId'),
//       storage.read(key: 'token'),
//       storage.read(key: 'expiryDate'),
//     ]);
//     userId = response[0];
//     token = response[1];
//     String? expiryDateString = response[2];
//     if (expiryDateString != null) {
//       expiryDate = DateTime.parse(expiryDateString);
//     }
//   }

//   void clearSession() async {
//     userId = null;
//     token = null;
//     expiryDate = null;

//     const FlutterSecureStorage storage = FlutterSecureStorage();
//     await Future.wait([
//       storage.delete(key: 'userId'),
//       storage.delete(key: 'token'),
//       storage.delete(key: 'expiryDate'),
//     ]);
//   }
// }
