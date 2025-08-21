import 'package:blog_app/models/post.dart';
import 'package:blog_app/widgets/colors.dart';
import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  final PostsItem post; // ek post item

  const PostTile({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.greyColor2,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 👈 alignment fix
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  // title overflow handle karega
                  child: Text(
                    post.title ?? " ",
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
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
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 8),

            // 🔹 Tags
            SizedBox(
              height: 25,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: post.tags?.length ?? 0,
                itemBuilder: (context, index) {
                  final tag = post.tags?[index] ?? "";
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.greyColor5,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      tag,
                      style: TextStyle(
                        color: AppColors.greyColor3,
                        fontSize: 12,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 8),

            // 🔹 Reactions + Views
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.thumb_up_rounded, color: AppColors.greyColor3),
                    const SizedBox(width: 5),
                    Text(
                      post.reactions?.likes.toString() ?? "0",
                      style: TextStyle(
                        color: AppColors.greyColor3,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.thumb_down_rounded, color: AppColors.greyColor3),
                    const SizedBox(width: 5),
                    Text(
                      post.reactions?.dislikes.toString() ?? "0",
                      style: TextStyle(
                        color: AppColors.greyColor3,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.remove_red_eye, color: AppColors.greyColor3),
                    const SizedBox(width: 5),
                    Text(
                      post.views.toString(),
                      style: TextStyle(
                        color: AppColors.greyColor3,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
