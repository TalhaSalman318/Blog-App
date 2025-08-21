import 'package:blog_app/models/quote.dart';

import '../models/post.dart';
import 'api_service.dart';

class QuotesService {
  final ApiService _api = ApiService();

  // --- Get paginated posts
  Future<QuoteModel> getQuotes({int limit = 10, int skip = 0}) async {
    final data = await _api.getApiResponse(
      "/quotes",
      query: {"limit": "$limit", "skip": "$skip"},
    );
    return QuoteModel.fromMap(data); // ✅ ab poora response parse hoga
  }

  // --- Get single post
  Future<QuoteModel> getQuote(int id) async {
    final data = await _api.getApiResponse("/quotes/$id");
    return QuoteModel.fromJson(data);
  }

  // --- Add new post
  Future<QuoteModel> addQuote(PostModel post) async {
    final data = await _api.postApiResponse(
      "/quotes/add",
      post.toJson() as Map<String, dynamic>,
    );
    return QuoteModel.fromJson(data);
  }

  // --- Update post
  Future<QuoteModel> updateQuote(int id, PostModel post) async {
    final data = await _api.putApiResponse(
      "/quotes/$id",
      post.toJson() as Map<String, dynamic>,
    );
    return QuoteModel.fromJson(data);
  }

  // --- Delete post
  Future<void> deleteQuote(int id) async {
    await _api.deleteApiResponse("/quotes/$id");
  }
}
