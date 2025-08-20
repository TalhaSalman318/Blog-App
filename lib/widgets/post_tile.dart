import 'package:blog_app/models/post.dart';
import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  final PostsItem post; // ek post item

  const PostTile({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ListTile(
        title: Text(post.title ?? ""), // nullable isliye ?? lagana zaroori
        subtitle: Text(post.body ?? ""),
      ),
    );
  }
}
