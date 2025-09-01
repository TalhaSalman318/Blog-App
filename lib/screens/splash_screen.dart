// lib/screens/splash_screen.dart
import 'dart:async';

import 'package:blog_app/providers/posts_provider.dart';
import 'package:blog_app/screens/login_screen.dart';
import 'package:blog_app/screens/navigation_bar.dart';
import 'package:blog_app/storage/session_storage.dart';
import 'package:blog_app/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    final session = SessionStorage();

    session.getToken().then((response) {
      Future.delayed(const Duration(seconds: 2), () {
        if (!mounted) return; // ✅ prevent navigation after dispose

        if (response == null || response.isEmpty) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const NavigationBar1()),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 180),

          Center(child: Image.asset("assets/splash/logo.png", height: 75)),
          SizedBox(height: 20),
          Text(
            "Daily Stories",
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),

          Text(
            "Your daily story at a glance",
            style: TextStyle(color: AppColors.greyColor1, fontSize: 16),
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(top: 160),
            child: Image.asset(
              "assets/splash/logo2.png",
              height: 45,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
