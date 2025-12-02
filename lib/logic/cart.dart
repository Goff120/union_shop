import 'package:flutter/foundation.dart';

class CartItem {
  final String imageUrl;
  final String name;
  final String price;
  int quantity;

  CartItem({
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'name': name,
      'price': price,
      'quantity': quantity,
    };
  }

}
class Cart extends ChangeNotifier {
  final Map<String, CartItem> _items = {};

  void addItem(String id, String imageUrl, String name, String price, int quantity) {
    if (_items.containsKey(id)) {
      _items[id]!.quantity += quantity;
    } else {
      _items[id] = CartItem(
        imageUrl: imageUrl,
        name: name,
        price: price,
        quantity: quantity,
      );
    }
    notifyListeners(); //re build page
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}