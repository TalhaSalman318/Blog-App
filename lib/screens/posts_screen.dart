import 'package:blog_app/models/post.dart';
import 'package:blog_app/screens/post_detail_screen.dart';
import 'package:blog_app/screens/search_post.dart';
import 'package:blog_app/services/posts_service.dart';
import 'package:blog_app/widgets/colors.dart';
import 'package:blog_app/widgets/post_tile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  final PostsService _postsService = PostsService();
  PostModel? _postModel;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    final result = await _postsService.getPosts(limit: 10);
    setState(() {
      _postModel = result as PostModel?;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) return const Center(child: CircularProgressIndicator());

    if (_postModel == null || _postModel!.posts == null) {
      return const Center(child: Text("No posts found"));
    }

    final posts = _postModel!.posts!; // List<PostsItem>

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        title: const Text(
          "Dailt Stories",
          style: TextStyle(
            fontSize: 20,
            color: AppColors.whiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Image.asset('assets/posts/order.png'),
                onPressed: () {
                  // Search functionality can be implemented here
                },
              ),
              IconButton(
                icon: Icon(Icons.search, color: AppColors.whiteColor),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchPost(posts: posts),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
        backgroundColor: AppColors.blackColor,
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index]; // <-- yahan ek PostsItem hai
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostDetailScreen(post: post),
                ),
              );
            },
            child: PostTile(post: post),
          ); // PostTile ko bhejna
        },
      ),
    );
  }
}
