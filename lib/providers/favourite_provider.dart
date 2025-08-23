import 'package:flutter/foundation.dart';

class FavouriteProvider with ChangeNotifier {
  final List<int> _favourites = [];

  List<int> get favourites => _favourites;

  void addItem(int index) {
    _favourites.add(index);
    notifyListeners();
  }

  void removeItem(int index) {
    _favourites.remove(index);
    notifyListeners();
  }
}
