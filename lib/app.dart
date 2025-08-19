// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// import 'providers/auth_provider.dart';
// import 'providers/posts_provider.dart';
// import 'providers/quotes_provider.dart';
// import 'screens/login_screen.dart';
// import 'screens/posts_screen.dart';
// import 'screens/quotes_screen.dart';

// class BlogApp extends StatelessWidget {
//   const BlogApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => AuthProvider()),
//         ChangeNotifierProvider(create: (_) => PostsProvider()),
//         // ChangeNotifierProvider(create: (_) => QuotesProvider()),
//       ],
//       child: MaterialApp(
//         title: 'Blog App',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),
//         initialRoute: '/login',
//         routes: {
//           '/login': (context) => LoginScreen(),
//           // '/posts': (context) => const PostsScreen(),
//           // '/quotes': (context) => const QuotesScreen(),
//         },
//         onGenerateRoute: (settings) {
//           // Handle 404 or redirect based on auth status
//           return MaterialPageRoute(builder: (context) => LoginScreen());
//         },
//       ),
//     );
//   }
// }
