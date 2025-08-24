import 'package:blog_app/widgets/colors.dart';
import 'package:flutter/material.dart';

class ProfilePost extends StatefulWidget {
  const ProfilePost({super.key});

  @override
  State<ProfilePost> createState() => _ProfilePostState();
}

class _ProfilePostState extends State<ProfilePost> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: AppColors.greyColor2,
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/profile/profile.png"),
                  ),
                  title: Text(
                    "Robert Clark",
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "2 hours ago",
                    style: TextStyle(color: AppColors.greyColor1),
                  ),
                  trailing: Icon(Icons.more_horiz, color: AppColors.greyColor1),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Exploring the mountains was an unforgettable adventure, filled with breathtaking views and thrilling experiences.",
                    style: TextStyle(color: AppColors.whiteColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.favorite_border_outlined,
                            color: AppColors.greyColor1,
                          ),
                          Text(
                            "24",
                            style: TextStyle(color: AppColors.greyColor1),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      Row(
                        children: [
                          Icon(Icons.comment, color: AppColors.greyColor1),
                          Text(
                            "4",
                            style: TextStyle(color: AppColors.greyColor1),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),

                      Row(
                        children: [
                          Icon(
                            Icons.question_mark_rounded,
                            color: AppColors.greyColor1,
                          ),
                          Text(
                            "24",
                            style: TextStyle(color: AppColors.greyColor1),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
