import 'package:equatable/equatable.dart';

class UsersItem extends Equatable {
  const UsersItem({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.username,
    this.password,
    this.token, // ✅ add kiya
  });

  factory UsersItem.fromMap(Map<String, dynamic> map) {
    return UsersItem(
      id: map['id'] as int?,
      firstName: map['firstName'] as String?,
      lastName: map['lastName'] as String?,
      email: map['email'] as String?,
      username: map['username'] as String?,
      password: map['password'] as String?,
      token: map['token'] as String?, // ✅ token map se uthayega
    );
  }

  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? username;
  final String? password;
  final String? token; // ✅ naya field

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'username': username,
      'password': password,
      'token': token, // ✅ save kar dega
    };
  }

  @override
  List<Object?> get props => [
    id,
    firstName,
    lastName,
    email,
    username,
    password,
    token, // ✅ props me bhi include
  ];

  Object? toJson() {}

  static UsersItem? fromJson(jsonDecode) {}
}
