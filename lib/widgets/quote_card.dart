import 'package:blog_app/models/post.dart';
import 'package:blog_app/models/quote.dart';
import 'package:flutter/material.dart';

class QuoteCard extends StatelessWidget {
  final QuotesItem quote; // ek post item

  const QuoteCard({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ListTile(
        title: Text(quote.author ?? ""), // nullable isliye ?? lagana zaroori
        subtitle: Text(quote.quote ?? ""),
      ),
    );
  }
}
