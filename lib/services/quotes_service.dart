import 'package:blog_app/services/api_service.dart';

class QuotesService {
  final ApiService _api = ApiService();

  Future<Map<String, dynamic>> getQuotes({int limit = 10, int skip = 0}) async {
    return await _api.getApiResponse("/quotes?limit=$limit&skip=$skip");
  }

  Future<Map<String, dynamic>> getQuoteById(int id) async {
    return await _api.getApiResponse("/quotes/$id");
  }

  Future<Map<String, dynamic>> getRandomQuote() async {
    return await _api.getApiResponse("/quotes/random");
  }
}
