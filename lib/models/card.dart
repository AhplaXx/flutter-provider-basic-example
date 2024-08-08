



import 'package:flutter/foundation.dart';
import 'package:provider_1/models/product.dart';

class Cart with ChangeNotifier{
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
  double get totalPrice {
    double total = 0.0;
    _items.forEach((productId, quantity) {
      // This is a placeholder price calculation.
      // You should fetch the product price from your product list.
      double productPrice = 10.0; // Example price
      total += productPrice * quantity;
    });
    return total;
  }

}