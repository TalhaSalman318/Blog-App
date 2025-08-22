import 'package:blog_app/models/quote.dart';
import 'package:blog_app/widgets/colors.dart';
import 'package:flutter/material.dart';

class QuoteCard extends StatelessWidget {
  final QuotesItem quote;

  const QuoteCard({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.q2grey,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: AppColors.q1grey, // 🔹 border color
          width: 2,
        ), // 🔹 border color & width
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 👈 alignment
          children: [
            Text(
              quote.quote ?? "",
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  " ~ ${quote.author ?? "Unknown"}",
                  style: TextStyle(color: AppColors.greyColor3, fontSize: 14),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/quotes/like_button.png'),
                    Image.asset('assets/quotes/share_button.png'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
