import 'dart:async';

import 'package:blog_app/screens/navigation_bar.dart';
import 'package:blog_app/storage/session_storage.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Screen")),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              final session = SessionController.instance;
              session.setSession('talha', '123456', DateTime.timestamp());
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const NavigationBar1()),
              );
            },
            child: Text("Login"),
          ),
        ],
      ),
    );
  }
}
