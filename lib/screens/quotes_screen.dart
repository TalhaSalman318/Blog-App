import 'package:blog_app/models/post.dart';
import 'package:blog_app/models/quote.dart';
import 'package:blog_app/services/posts_service.dart';
import 'package:blog_app/services/quotes_service.dart';
import 'package:blog_app/widgets/colors.dart';
import 'package:blog_app/widgets/post_tile.dart';
import 'package:blog_app/widgets/quote_card.dart';
import 'package:flutter/material.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  final QuotesService _qoutesService = QuotesService();
  QuoteModel? _quoteModel;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    fetchQuotes();
  }

  Future<void> fetchQuotes() async {
    final result = await _qoutesService.getQuotes(limit: 10);
    setState(() {
      _quoteModel = result as QuoteModel?;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) return const Center(child: CircularProgressIndicator());

    if (_quoteModel == null || _quoteModel!.quotes == null) {
      return const Center(child: Text("No Quotes found"));
    }

    final quotes = _quoteModel!.quotes!; // List<PostsItem>

    return Scaffold(
      backgroundColor: AppColors.blackColor,

      appBar: AppBar(
        title: const Text("Quotes"),
        backgroundColor: AppColors.blackColor,
      ),
      body: ListView.builder(
        itemCount: quotes.length,
        itemBuilder: (context, index) {
          final quote = quotes[index]; // <-- yahan ek PostsItem hai
          return QuoteCard(quote: quote); // PostTile ko bhejna
        },
      ),
    );
  }
}
