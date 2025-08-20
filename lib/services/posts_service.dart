import '../models/post.dart';
import 'api_service.dart';

class PostsService {
  final ApiService _api = ApiService();

  // --- Get paginated posts
  Future<PostModel> getPosts({int limit = 10, int skip = 0}) async {
    final data = await _api.getApiResponse(
      "/posts",
      query: {"limit": "$limit", "skip": "$skip"},
    );
    return PostModel.fromMap(data); // ✅ ab poora response parse hoga
  }

  // --- Get single post
  Future<PostModel> getPost(int id) async {
    final data = await _api.getApiResponse("/posts/$id");
    return PostModel.fromJson(data);
  }

  // --- Add new post
  Future<PostModel> addPost(PostModel post) async {
    final data = await _api.postApiResponse(
      "/posts/add",
      post.toJson() as Map<String, dynamic>,
    );
    return PostModel.fromJson(data);
  }

  // --- Update post
  Future<PostModel> updatePost(int id, PostModel post) async {
    final data = await _api.putApiResponse(
      "/posts/$id",
      post.toJson() as Map<String, dynamic>,
    );
    return PostModel.fromJson(data);
  }

  // --- Delete post
  Future<void> deletePost(int id) async {
    await _api.deleteApiResponse("/posts/$id");
  }
}
