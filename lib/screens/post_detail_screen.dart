import 'package:blog_app/models/post.dart';
import 'package:blog_app/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PostDetailScreen extends StatefulWidget {
  final PostsItem post; // ek post item
  const PostDetailScreen({super.key, required this.post});

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        title: Center(
          child: const Text(
            "Daily Stories",
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.favorite, color: AppColors.whiteColor, size: 23),
                  Text(
                    widget.post.reactions?.likes.toString() ?? "0",
                    style: TextStyle(color: AppColors.whiteColor),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.heart_broken,
                    color: AppColors.whiteColor,
                    size: 23,
                  ),
                  Text(
                    widget.post.reactions?.dislikes.toString() ?? "0",
                    style: TextStyle(color: AppColors.whiteColor),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.remove_red_eye,
                    color: AppColors.whiteColor,
                    size: 23,
                  ),
                  Text(
                    widget.post.views.toString() ?? "0",
                    style: TextStyle(color: AppColors.whiteColor),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.share, color: AppColors.whiteColor, size: 23),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
