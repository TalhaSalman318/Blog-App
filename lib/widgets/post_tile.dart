import 'package:blog_app/models/post.dart';
import 'package:blog_app/widgets/colors.dart';
import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  final PostsItem post; // ek post item

  const PostTile({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: 100,
          decoration: BoxDecoration(color: AppColors.greyColor2),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    post.title ?? " ",
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete, color: AppColors.whiteColor),
                  ),
                ],
              ),
              Text(
                post.body ?? " ",
                style: TextStyle(color: AppColors.greyColor1, fontSize: 14),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
