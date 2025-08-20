import '../models/quote.dart';
import 'api_service.dart';

class QuotesService {
  final ApiService _api = ApiService();

  // --- Get paginated quotes
  Future<(List<QuoteModel>, int)> getQuotes({
    int limit = 10,
    int skip = 0,
  }) async {
    final data = await _api.getApiResponse(
      "/quotes",
      query: {"limit": "$limit", "skip": "$skip"},
    );

    final quotes = (data["quotes"] as List)
        .map((e) => QuoteModel.fromJson(e))
        .toList();

    return (quotes, data["total"] as int);
  }

  // --- Get single quote
  Future<QuoteModel> getQuote(int id) async {
    final data = await _api.getApiResponse("/quotes/$id");
    return QuoteModel.fromJson(data);
  }
}
