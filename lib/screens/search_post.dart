import 'dart:math';

import 'package:blog_app/models/post.dart';
import 'package:blog_app/widgets/colors.dart';
import 'package:flutter/material.dart';

class SearchPost extends StatefulWidget {
  final List<PostsItem> posts;

  final List<Color> myColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
  ];

  final List<String> myImages = [
    'assets/search/history_image.png',
    'assets/search/french_image.png',
    'assets/search/magical.png',
    'assets/search/myestry.png',
    'assets/search/crime.png',
  ];

  SearchPost({super.key, required this.posts});

  @override
  State<SearchPost> createState() => _SearchPostState();
}

class _SearchPostState extends State<SearchPost> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

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
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: widget.posts.length,
                itemBuilder: (context, index) {
                  final random_image = widget
                      .myImages[index % widget.myImages.length]; // cycle karega
                  final random_color =
                      widget.myColors[index % widget.myColors.length];
                  final post = widget.posts[index];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: AppColors.greyColor2,
                      ),
                      height: 125,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                color: random_color,
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  image: AssetImage(random_image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  post.title ?? " ",
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 25,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: random_color,
                                        borderRadius: BorderRadius.circular(
                                          20.0,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          post.tags![0] ?? "",
                                          style: TextStyle(
                                            color: AppColors.whiteColor,
                                          ),
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            Icons.remove_red_eye,
                                            color: AppColors.greyColor1,
                                          ),
                                          Text(
                                            post.views.toString() ?? "",
                                            style: TextStyle(
                                              color: AppColors.greyColor1,
                                            ),
                                          ),
                                        ],
                                      ),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
