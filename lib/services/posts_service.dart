import 'package:blog_app/services/api_service.dart';

class PostsService {
  final ApiService _api = ApiService();

  Future<Map<String, dynamic>> getPosts({int limit = 10, int skip = 0}) async {
    return await _api.getApiResponse("/posts?limit=$limit&skip=$skip");
  }

  Future<Map<String, dynamic>> getPostById(int id) async {
    return await _api.getApiResponse("/posts/$id");
  }

  Future<Map<String, dynamic>> searchPosts(String query) async {
    return await _api.getApiResponse("/posts/search?q=$query");
  }

  Future<Map<String, dynamic>> addPost(Map<String, dynamic> newPost) async {
    return await _api.postApiResponse("/posts/add", newPost);
  }

  Future<Map<String, dynamic>> updatePost(
    int id,
    Map<String, dynamic> updatedPost,
  ) async {
    return await _api.updateApiResponse("/posts/$id", updatedPost);
  }

  Future<Map<String, dynamic>> deletePost(int id) async {
    return await _api.deleteApiResponse("/posts/$id");
  }
}
