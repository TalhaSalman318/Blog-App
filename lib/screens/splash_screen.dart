// lib/screens/splash_screen.dart
import 'package:blog_app/providers/posts_provider.dart';
import 'package:blog_app/screens/navigation_bar.dart';
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

    Future.delayed(const Duration(seconds: 10000000), () async {
      await Provider.of<PostsProvider>(context, listen: false);

      // Now go to HomeScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const NavigationBar1()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),

                Center(
                  child: Image.asset("assets/splash/logo.png", height: 75),
                ),
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
                  padding: const EdgeInsets.only(top: 70),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Image.asset(
                      "assets/splash/logo2.png",
                      height: 45,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
