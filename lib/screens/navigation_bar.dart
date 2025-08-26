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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.greyColor4,
        currentIndex: cindex,
        onTap: (index) {
          setState(() {
            cindex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/navigation/home.png",
              width: 34,
              height: 24,
              fit: BoxFit.cover,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/navigation/quotes.png",
              width: 24,
              height: 24,
              color: cindex == 1 ? Colors.white : Colors.grey,
            ),
            label: 'Quotries',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/navigation/profile.png",
              width: 24,
              height: 24,
              color: cindex == 2 ? Colors.white : Colors.grey,
            ),
            label: 'Profile',
          ),
        ],
        selectedLabelStyle: TextStyle(color: Colors.white),
        unselectedLabelStyle: TextStyle(color: Colors.white),

        // 👇 Yeh ignore ho jaayenge kyunki upar style set hai
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
      ),
      body: cindex == 0
          ? const PostsScreen()
          : cindex == 1
          ? QuotesScreen()
          : const ProfileScreen(),
    );
  }
}
