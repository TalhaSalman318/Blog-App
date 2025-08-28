import 'dart:async';

import 'package:blog_app/providers/auth_provider.dart';
import 'package:blog_app/screens/navigation_bar.dart';
import 'package:blog_app/storage/session_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Login Screen")),
      body: Column(
        children: [
          TextFormField(
            controller: usernameController,
            decoration: InputDecoration(hintText: "Username"),
          ),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(hintText: "password"),
          ),
          authProvider.isLoading
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () async {
                    try {
                      await authProvider.login(
                        usernameController.text,
                        passwordController.text,
                      );
                      if (authProvider.isLoggedIn) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const NavigationBar1(),
                          ),
                        );
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text("Error: $e")));
                    }
                  },
                  child: const Text("Login"),
                ),
        ],
      ),
    );
  }
}
