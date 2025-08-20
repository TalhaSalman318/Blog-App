import 'package:blog_app/providers/posts_provider.dart';
import 'package:blog_app/screens/posts_screen.dart';
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
      providers: [ChangeNotifierProvider(create: (_) => PostsProvider())],
      child: MaterialApp(
        title: 'Blog App',
        debugShowCheckedModeBanner: false,
        home: PostsScreen(),
      ),
    );
  }
}
