



import 'package:flutter/foundation.dart';
import 'package:provider_1/models/product.dart';

class Card with ChangeNotifier{
  Map<String, int> _items = {};
  Map<String,int> get items => _items;


  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items[product.id] = _items[product.id]! + 1;
    } else {
      _items[product.id] = 1;
    }
    notifyListeners();
  }
  void removeItem(Product product) {
    if (_items.containsKey(product.id) && _items[product.id]! > 0) {
      _items[product.id] = _items[product.id]! - 1;
      if (_items[product.id] == 0) {
        _items.remove(product.id);
      }
      notifyListeners();
    }
  }
  int getItemCount(Product product) {
    return _items[product.id] ?? 0;
  }

}