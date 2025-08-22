import 'package:blog_app/models/post.dart';
import 'package:blog_app/providers/posts_provider.dart';
import 'package:blog_app/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class PostDetailScreen extends StatefulWidget {
  final PostsItem post; // ek post item
  const PostDetailScreen({super.key, required this.post});

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Screen size
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        centerTitle: true,
        title: const Text(
          "Daily Stories",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: AppColors.whiteColor,
                        size: width * 0.06,
                      ),
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
                        size: width * 0.06,
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
                        size: width * 0.06,
                      ),
                      Text(
                        widget.post.views.toString() ?? "0",
                        style: TextStyle(color: AppColors.whiteColor),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.share,
                        color: AppColors.whiteColor,
                        size: width * 0.06,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Text(
                widget.post.title ?? "No Title",
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: width * 0.07,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Text(
                widget.post.body ?? "No Title",
                style: TextStyle(
                  color: AppColors.greyColor1,
                  fontSize: width * 0.05,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                onTap: () {
                  context.read<PostsProvider>().deletePost(widget.post.id!);
                  Navigator.pop(context); // ✅ delete ke baad back ho jao
                  print("deleted");
                },
                child: Container(
                  height: height * 0.07,
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.delete,
                        color: AppColors.whiteColor,
                        size: width * 0.08,
                      ),
                      Text(
                        "Delete Post",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: width * 0.05,
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.redColor,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
