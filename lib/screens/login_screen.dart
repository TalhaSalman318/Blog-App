import 'package:blog_app/main.dart';
import 'package:blog_app/providers/auth_provider.dart';
import 'package:blog_app/providers/login_provider.dart';
import 'package:blog_app/screens/navigation_bar.dart';
import 'package:blog_app/storage/session_storage.dart';
import 'package:blog_app/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.blackColor),
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title
                  Text(
                    "Login",
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: "inter",
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Enter Email and Password to continue...",
                    style: TextStyle(
                      color: AppColors.greyColor1,
                      fontSize: 16,
                      fontFamily: "inter",
                    ),
                  ),
                  const SizedBox(height: 40),

                  /// Email Field
                  TextFormField(
                    controller: usernameController,
                    style: const TextStyle(color: AppColors.whiteColor),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.greyColor5,
                      hintText: "Username",
                      hintStyle: TextStyle(color: AppColors.greyColor1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? "Enter your username" : null,
                  ),
                  const SizedBox(height: 20),

                  /// Password Field
                  Consumer<LoginProvider>(
                    builder: (context, loginProvider, child) {
                      return TextFormField(
                        controller: passwordController,
                        obscureText: loginProvider.obscurePassword,
                        style: const TextStyle(color: AppColors.whiteColor),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.greyColor5,
                          hintText: "Password",
                          hintStyle: TextStyle(color: AppColors.greyColor1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              loginProvider.obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColors.greyColor1,
                            ),
                            onPressed: loginProvider.toggleVisibility,
                          ),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? "Enter your password" : null,
                      );
                    },
                  ),
                  const SizedBox(height: 30),

                  /// Login Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.redColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await authProvider.login(
                            usernameController.text,
                            passwordController.text,
                          );

                          if (authProvider.user != null) {
                            final session = SessionStorage();

                            // ✅ Yahan token save karo
                            await session.saveToken(authProvider.user!.token);

                            // ✅ Navigate to NavigationBar1
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NavigationBar1(),
                              ),
                            );
                          } else if (authProvider.error != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(authProvider.error!)),
                            );
                          }
                        }
                      },

                      child: authProvider.isLoading
                          ? const CircularProgressIndicator(
                              color: AppColors.whiteColor,
                            )
                          : const Text(
                              "Login",
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: "inter",
                              ),
                            ),
                    ),
                  ),

                  SizedBox(height: 20),

                  /// Sign Up Text
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Don’t have an account? Sign Up",
                        style: TextStyle(
                          color: AppColors.greyColor3,
                          fontSize: 14,
                          fontFamily: "Inter",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
