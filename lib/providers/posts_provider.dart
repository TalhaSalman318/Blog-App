import 'package:flutter/foundation.dart';
import '../models/post.dart';
import '../services/posts_service.dart';

class PostsProvider extends ChangeNotifier {
  final PostsService _postsService = PostsService();

  final List<PostsItem> _posts = [];

  List<PostsItem> get posts => List.unmodifiable(_posts);

  bool _isLoading = false;
  String? _error;
  int _total = 0;
  int _skip = 0;
  final int _limit = 10;

  bool get isLoading => _isLoading;
  String? get error => _error;
  int get total => _total;
  bool get hasMore => _posts.length < _total;

  // 🔹 Fetch posts with pagination
  Future<void> fetchPosts({bool refresh = false}) async {
    if (_isLoading) return;
    _setLoading(true);
  }

  // 🔹 Add new post (optimistic)
  Future<void> addPost(PostsItem newPost) async {
    final temp = newPost.copyWith(
      id: DateTime.now().millisecondsSinceEpoch * -1,
    ); // temp ID
    _posts.insert(0, temp);
    notifyListeners();

    try {
      final created = await _postsService.addPost(newPost as PostModel);
      final idx = _posts.indexWhere((p) => p.id == temp.id);
      if (idx != -1) _posts[idx] = created as PostsItem;
    } catch (e) {
      _posts.removeWhere((p) => p.id == temp.id);
      _error = e.toString();
    } finally {
      notifyListeners();
    }
  }

  // 🔹 Update post (optimistic)
  Future<void> updatePost(int id, PostsItem updated) async {
    final idx = _posts.indexWhere((p) => p.id == id);
    if (idx == -1) return;

    final old = _posts[idx];
    _posts[idx] = updated;
    notifyListeners();

    try {
      final res = await _postsService.updatePost(id, updated as PostModel);
      _posts[idx] = res as PostsItem;
    } catch (e) {
      _posts[idx] = old;
      _error = e.toString();
    } finally {
      notifyListeners();
    }
  }

  // 🔹 Delete post (optimistic)
  Future<void> deletePost(int id) async {
    final idx = _posts.indexWhere((p) => p.id == id);
    if (idx == -1) return;

    final removed = _posts.removeAt(idx);
    notifyListeners();

    try {
      await _postsService.deletePost(id);
    } catch (e) {
      _posts.insert(idx, removed); // rollback
      _error = e.toString();
      notifyListeners();
    }
  }

  // 🔹 Helpers
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
