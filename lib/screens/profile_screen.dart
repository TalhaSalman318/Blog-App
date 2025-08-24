import 'package:blog_app/widgets/colors.dart';
import 'package:blog_app/widgets/profile_post.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [Icon(Icons.more_vert_rounded, color: AppColors.whiteColor)],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("assets/profile/profile.png"),
            ),
            SizedBox(height: 10),
            Text(
              "Robert Clark",
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Robert_|_design",
              style: TextStyle(color: AppColors.greyColor1, fontSize: 18),
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "127",
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Posts",
                      style: TextStyle(color: AppColors.greyColor1),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "2.4k",
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Likes",
                      style: TextStyle(color: AppColors.greyColor1),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "227",
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Views",
                      style: TextStyle(color: AppColors.greyColor1),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 25),
            SizedBox(
              height: 500, // ya jitni chahiye utni height
              child: ProfilePost(),
            ),
          ],
        ),
      ),
    );
  }
}
