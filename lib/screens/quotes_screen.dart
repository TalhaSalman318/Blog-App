import 'package:blog_app/models/quote.dart';
import 'package:blog_app/services/quotes_service.dart';
import 'package:blog_app/widgets/colors.dart';
import 'package:blog_app/widgets/quote_card.dart';
import 'package:flutter/material.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  final QuotesService _quotesService = QuotesService();

  final List<QuotesItem> _quotes = [];
  final ScrollController _scrollController = ScrollController();

  bool _loading = true;
  bool _isFetchingMore = false;
  bool _hasMore = true;
  int _skip = 0;
  final int _limit = 10;
  int _total = 0;

  @override
  void initState() {
    super.initState();
    _fetchQuotes();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !_isFetchingMore &&
          _hasMore) {
        _fetchMoreQuotes();
      }
    });
  }

  Future<void> _fetchQuotes() async {
    try {
      final result = await _quotesService.getQuotes(limit: _limit, skip: _skip);

      setState(() {
        _quotes.addAll(result.quotes ?? []);
        _total = result.total ?? 0;
        _skip += _limit;
        _hasMore = _quotes.length < _total;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _loading = false;
        _hasMore = false;
      });
    }
  }

  Future<void> _fetchMoreQuotes() async {
    setState(() => _isFetchingMore = true);

    try {
      final result = await _quotesService.getQuotes(limit: _limit, skip: _skip);

      setState(() {
        _quotes.addAll(result.quotes ?? []);
        _skip += _limit;
        _hasMore = _quotes.length < _total;
      });
    } finally {
      setState(() => _isFetchingMore = false);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Loading state
    if (_loading) {
      return const Scaffold(
        backgroundColor: AppColors.q2grey,
        body: Center(
          child: CircularProgressIndicator(color: AppColors.whiteColor),
        ),
      );
    }

    // Empty/Error state
    if (_quotes.isEmpty) {
      return const Scaffold(
        backgroundColor: AppColors.q2grey,
        body: Center(
          child: Text(
            "No Quotes found",
            style: TextStyle(color: AppColors.whiteColor),
          ),
        ),
      );
    }

    // Success state
    return Scaffold(
      backgroundColor: AppColors.q2grey,
      appBar: AppBar(
        title: const Text(
          "Quotes",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.q2grey,
      ),
      body: Column(
        children: [
          Divider(color: AppColors.q1grey),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _quotes.length + (_hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < _quotes.length) {
                  return QuoteCard(quote: _quotes[index]);
                } else {
                  // Bottom loader
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.whiteColor,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
