import 'package:blog_app/providers/favourite_provider.dart';
import 'package:blog_app/providers/posts_provider.dart';
import 'package:blog_app/providers/quotes_provider.dart';
import 'package:blog_app/screens/navigation_bar.dart';
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
        ChangeNotifierProvider(create: (_) => PostsProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteProvider()),
        ChangeNotifierProvider(create: (_) => QuotesProvider()),
      ],
      child: MaterialApp(
        title: 'Blog App',
        debugShowCheckedModeBanner: false,
        home: NavigationBar1(),
      ),
    );
  }
}
