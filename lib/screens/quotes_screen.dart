// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/quotes_provider.dart';
// import '../widgets/quote_card.dart';

// class QuotesScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final quotesProvider = Provider.of<QuotesProvider>(context);

//     return Scaffold(
//       appBar: AppBar(title: Text('Quotes')),
//       body: ListView.builder(
//         itemCount: quotesProvider.quotes.length,
//         itemBuilder: (context, index) {
//           return QuoteCard(quote: quotesProvider.quotes[index]);
//         },
//       ),
//     );
//   }
// }
