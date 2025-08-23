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

    try {
      if (refresh) {
        _skip = 0;
        _posts.clear();
      }

      final response = await _postsService.getPosts(limit: _limit, skip: _skip);

      // agar API total bhejti hai to use, warna calculate karlo
      _total =
          response.total ?? (_posts.length + (response.posts?.length ?? 0));

      if (response.posts != null && response.posts!.isNotEmpty) {
        _posts.addAll(response.posts!);
        _skip += _limit; // next page ke liye offset barhao
      } else {
        // koi nayi post nahi mili → total fix kar do
        _total = _posts.length;
      }

      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _setLoading(false);
    }
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
