import 'package:blog_app/models/post.dart';
import 'package:flutter/foundation.dart';
import '../models/quote.dart';
import '../services/quotes_service.dart';

class QuotesProvider extends ChangeNotifier {
  final QuotesService _quotesService = QuotesService();

  final List<QuotesItem> _quotes = [];
  List<QuotesItem> get quotes => List.unmodifiable(_quotes);

  bool _isLoading = false;
  String? _error;
  int _total = 0;
  int _skip = 0;
  final int _limit = 10;

  bool get isLoading => _isLoading;
  String? get error => _error;
  int get total => _total;
  bool get hasMore => _quotes.length < _total;

  // 🔹 Fetch quotes with pagination
  Future<void> fetchQuotes({bool refresh = false}) async {
    if (_isLoading) return;

    if (refresh) {
      _skip = 0;
      _quotes.clear();
      _total = 0;
    }

    _setLoading(true);
    try {
      final response = await _quotesService.getQuotes(
        limit: _limit,
        skip: _skip,
      );

      _quotes.addAll(response.quotes as Iterable<QuotesItem>);
      _total = response.total!;
      _skip += _limit;
    } catch (e) {
      _error = e.toString();
    } finally {
      _setLoading(false);
    }
  }

  // 🔹 Add new quote (optimistic update)
  Future<void> addQuote(QuotesItem newQuote) async {
    final temp = newQuote.copyWith(
      id: DateTime.now().millisecondsSinceEpoch * -1,
    ); // temporary negative ID
    _quotes.insert(0, temp);
    notifyListeners();

    try {
      final created = await _quotesService.addQuote(newQuote as PostModel);
      final idx = _quotes.indexWhere((q) => q.id == temp.id);
      if (idx != -1) _quotes[idx] = created as QuotesItem;
    } catch (e) {
      _quotes.removeWhere((q) => q.id == temp.id);
      _error = e.toString();
    } finally {
      notifyListeners();
    }
  }

  // 🔹 Update quote (optimistic update)
  Future<void> updateQuote(int id, QuotesItem updated) async {
    final idx = _quotes.indexWhere((q) => q.id == id);
    if (idx == -1) return;

    final old = _quotes[idx];
    _quotes[idx] = updated;
    notifyListeners();

    try {
      final res = await _quotesService.updateQuote(id, updated as PostModel);
      _quotes[idx] = res as QuotesItem;
    } catch (e) {
      _quotes[idx] = old; // rollback
      _error = e.toString();
    } finally {
      notifyListeners();
    }
  }

  // 🔹 Delete quote (optimistic update)
  Future<void> deleteQuote(int id) async {
    final idx = _quotes.indexWhere((q) => q.id == id);
    if (idx == -1) return;

    final removed = _quotes.removeAt(idx);
    notifyListeners();

    try {
      await _quotesService.deleteQuote(id);
    } catch (e) {
      _quotes.insert(idx, removed); // rollback
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
