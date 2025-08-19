// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/posts_provider.dart';
// import '../widgets/post_tile.dart';

// class PostsScreen extends StatefulWidget {
//   @override
//   _PostsScreenState createState() => _PostsScreenState();
// }

// class _PostsScreenState extends State<PostsScreen> {
//   final _scrollController = ScrollController();

//   @override
//   void initState() {
//     super.initState();
//     final postsProvider = Provider.of<PostsProvider>(context, listen: false);
//     postsProvider.loadPosts();
//     _scrollController.addListener(_onScroll);
//   }

//   void _onScroll() {
//     if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
//       Provider.of<PostsProvider>(context, listen: false).loadPosts();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final postsProvider = Provider.of<PostsProvider>(context);

//     return Scaffold(
//       appBar: AppBar(title: Text('Posts')),
//       body: ListView.builder(
//         controller: _scrollController,
//         itemCount: postsProvider.posts.length + (postsProvider.hasMore ? 1 : 0),
//         itemBuilder: (context, index) {
//           if (index < postsProvider.posts.length) {
//             return PostTile(post: postsProvider.posts[index]);
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//     );
//   }
// }
