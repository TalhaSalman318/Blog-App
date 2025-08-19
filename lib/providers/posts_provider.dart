import 'package:flutter/material.dart';
import '../services/posts_service.dart';

class PostsProvider with ChangeNotifier {
  List<dynamic> _posts = [];
  bool _isLoading = false;
  int _currentPage = 0;
  bool _hasMore = true;

  List<dynamic> get posts => _posts;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;

  Future<void> loadPosts() async {
    if (!_hasMore || _isLoading) return;

    _isLoading = true;
    notifyListeners();

    try {
      final response = await PostsService.fetchPosts(skip: _currentPage * 10);
      _posts.addAll(response['posts']);
      _currentPage++;
      _hasMore = _posts.length < response['total'];
    } catch (e) {
      print('Error loading posts: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
