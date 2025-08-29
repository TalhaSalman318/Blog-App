import 'package:blog_app/providers/auth_provider.dart';
import 'package:blog_app/providers/favourite_provider.dart';
import 'package:blog_app/providers/login_provider.dart';
import 'package:blog_app/providers/posts_provider.dart';
import 'package:blog_app/providers/quotes_provider.dart';
import 'package:blog_app/screens/login_screen.dart';
import 'package:blog_app/screens/navigation_bar.dart';
import 'package:blog_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PostsProvider()),
        ChangeNotifierProvider(create: (context) => QuotesProvider()),
        // ChangeNotifierProvider(create: (context) => UserProvider()),
        // ChangeNotifierProvider(create: (context) => NavigationbarProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        // ChangeNotifierProvider(create: (context) => UserPostsProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
              color: Colors.white, // 👈 sab screens ke liye back arrow color
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: Consumer<AuthProvider>(
          builder: (context, authProvider, _) {
            // // If token exists and user is loaded, go to HomeScreen
            if (authProvider.user != null) {
              return const MyApp();
            }
            return const NavigationBar1();
          },
        ),
      ),
    );
  }
}
