import 'package:blog_app/providers/posts_provider.dart';
import 'package:blog_app/screens/post_detail_screen.dart';
import 'package:blog_app/screens/search_post.dart';
import 'package:blog_app/widgets/colors.dart';
import 'package:blog_app/widgets/post_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Initial Load
    Future.microtask(
      () => Provider.of<PostsProvider>(context, listen: false).fetchPosts(),
    );

    // Scroll listener
    _scrollController.addListener(() {
      final provider = Provider.of<PostsProvider>(context, listen: false);

      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !provider.isLoading &&
          provider.hasMore) {
        provider.fetchPosts();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PostsProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading && provider.posts.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (provider.error != null && provider.posts.isEmpty) {
          return Center(child: Text("Error: ${provider.error}"));
        }

        final posts = provider.posts;

        return Scaffold(
          backgroundColor: AppColors.blackColor,
          appBar: AppBar(
            title: const Text(
              "Daily Stories",
              style: TextStyle(
                fontSize: 20,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              Image.asset("assets/posts/order.png", height: 18),
              IconButton(
                icon: const Icon(Icons.search, color: AppColors.whiteColor),
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
            backgroundColor: AppColors.blackColor,
          ),

          body: Column(
            children: [
              Divider(color: AppColors.q1grey),

              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: posts.length + (provider.hasMore ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index < posts.length) {
                      final post = posts[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PostDetailScreen(post: post),
                            ),
                          );
                        },
                        child: PostTile(post: post),
                      );
                    } else {
                      // Loader at bottom jab aur data load ho raha ho
                      return const Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
