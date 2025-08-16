import 'package:flutter/material.dart';
import 'package:blog_app/services/quotes_service.dart';
import 'package:blog_app/models/quote.dart';

class QuotesProvider with ChangeNotifier {
  final QuotesService _quotesService = QuotesService();

  List<QuoteModel> _quotes = [];
  QuoteModel? _randomQuote;
  bool _isLoading = false;
  String? _error;

  List<QuoteModel> get quotes => _quotes;
  QuoteModel? get randomQuote => _randomQuote;
  bool get isLoading => _isLoading;
  String? get error => _error;

  /// Fetch all quotes (paginated)
  Future<void> fetchQuotes({int limit = 10, int skip = 0}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final data = await _quotesService.getQuotes(limit: limit, skip: skip);

      // 🔥 Directly parse list of quotes from response
      _quotes = (data['quotes'] as List)
          .map((q) => QuoteModel.fromMap(q))
          .toList();
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  /// Fetch a single quote by ID
  Future<QuoteModel?> fetchQuoteById(int id) async {
    try {
      final data = await _quotesService.getQuoteById(id);
      return QuoteModel.fromMap(data); // ✅ ek single quote
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return null;
    }
  }

  /// Fetch a random quote
  Future<void> fetchRandomQuote() async {
    _isLoading = true;
    notifyListeners();

    try {
      final data = await _quotesService.getRandomQuote();
      _randomQuote = QuoteModel.fromMap(data); // ✅ ek single quote
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
