import 'package:blog_app/models/post.dart';
import 'package:blog_app/widgets/colors.dart';
import 'package:flutter/material.dart';

class SearchPost extends StatefulWidget {
  final List<PostsItem> posts;

  const SearchPost({super.key, required this.posts});

  @override
  State<SearchPost> createState() => _SearchPostState();
}

class _SearchPostState extends State<SearchPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Search", style: TextStyle(color: AppColors.whiteColor)),
        backgroundColor: AppColors.blackColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(color: AppColors.greyColor1),
                prefixIcon: Icon(Icons.search, color: AppColors.greyColor1),
                filled: true,
                fillColor: AppColors.greyColor5,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: AppColors.whiteColor),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                itemCount: widget.posts.length,
                itemBuilder: (context, index) {
                  final post = widget.posts[index];
                  return Card(
                    color: AppColors.greyColor5,
                    child: ListTile(
                      title: Text(
                        post.title ?? " ",
                        style: TextStyle(color: AppColors.whiteColor),
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Card(
                            child: Text(
                              post.tags![0] ?? "",
                              style: TextStyle(color: AppColors.whiteColor),
                            ),
                          ),
                          Text(post.reactions?.likes.toString() ?? ""),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
