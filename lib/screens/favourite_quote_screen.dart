// import 'package:blog_app/providers/favourite_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class FavouriteQuoteScreen extends StatefulWidget {
//   const FavouriteQuoteScreen({super.key});

//   @override
//   State<FavouriteQuoteScreen> createState() => _FavouriteQuoteScreenState();
// }

// class _FavouriteQuoteScreenState extends State<FavouriteQuoteScreen> {
//   @override
//   Widget build(BuildContext context) {
//     // final provider = Provider.of<FavouriteProvider>(context, listen: false);
//     print("Built");
//     final favouriteProvider = Provider.of<FavouriteProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Favourite Screen'),
//         backgroundColor: Colors.red[50],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: favouriteProvider.selectedItems.length,
//               itemBuilder: (context, index) {
//                 return Consumer<FavouriteProvider>(
//                   builder: (context, value, child) {
//                     return ListTile(
//                       onTap: () {
//                         if (value.selectedItems.contains(index)) {
//                           value.removeItem(index);
//                         } else {
//                           value.addItem(index);
//                         }
//                       },
//                       title: Text('Item' + index.toString()),
//                       subtitle: Text('Subtitle for item $index'),
//                       trailing: Icon(
//                         value.selectedItems.contains(index)
//                             ? Icons.favorite
//                             : Icons.favorite_border,
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
