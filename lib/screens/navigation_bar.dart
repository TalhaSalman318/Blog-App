import 'package:blog_app/screens/posts_screen.dart';
import 'package:blog_app/screens/profile_screen.dart';
import 'package:blog_app/screens/quotes_screen.dart';
import 'package:blog_app/widgets/colors.dart';
import 'package:flutter/material.dart';

class NavigationBar1 extends StatefulWidget {
  const NavigationBar1({super.key});

  @override
  State<NavigationBar1> createState() => _TabBar1State();
}

class _TabBar1State extends State<NavigationBar1> {
  int cindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.greyColor4,

        currentIndex: cindex,
        onTap: (index) {
          setState(() {
            cindex = index; // Update the index when a tab is tapped
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/navigation/home.jpg'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/navigation/quotes.png'),
            label: 'Quotries',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/navigation/profile.jpg'),
            label: 'Profile',
          ),
        ],
      ),

      // Body with conditional rendering
      body: Column(
        children: [
          Expanded(
            child: cindex == 0
                ? const PostsScreen()
                : cindex == 1
                ? const QuotesScreen()
                : cindex == 2
                ? const ProfileScreen()
                : Container(), // Fallback, should never happen
          ),
        ],
      ),
    );
  }
}
