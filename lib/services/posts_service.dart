import 'dart:convert';
import 'package:http/http.dart' as http;

class PostsService {
  static const String _baseUrl = 'https://dummyjson.com/posts';

  // Fetch posts with pagination
  static Future<Map<String, dynamic>> fetchPosts({
    int limit = 10,
    int skip = 0,
  }) async {
    final response = await http.get(
      Uri.parse('$_baseUrl?limit=$limit&skip=$skip'),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
