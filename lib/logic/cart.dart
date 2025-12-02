import 'package:flutter/foundation.dart';

class CartItem {
  final String imageUrl;
  final String name;
  final String price;
  int quantity;
  final String colour;
  final String size;

  CartItem({
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.quantity,
    required this.colour,
    required this.size,
  });

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'name': name,
      'price': price,
      'quantity': quantity,
    };
  }

  double getTotalPrice() {
    final priceValue = double.tryParse(price.replaceAll('£', '')) ?? 0.0;
    return priceValue * quantity;
  }

}
class Cart extends ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => {..._items};
  int get itemCount => _items.length;
  
  int get totalQuantity {
    return _items.values.fold(0, (sum, item) => sum + item.quantity);
  }

  double get totalPrice {
    return _items.values.fold(0.0, (sum, item) => sum + item.getTotalPrice());
  }

  void addItem(String id, String imageUrl, String name, String price, int quantity,String colour, String size) {
    if (_items.containsKey(id)) {
      _items[id]!.quantity += quantity;
    } else {
      _items[id] = CartItem(
        imageUrl: imageUrl,
        name: name,
        price: price,
        quantity: quantity,
        colour: colour,
        size: size
      );
    }
    notifyListeners(); //re build page
  }

  void updateQuantity(String id, int newQuantity) {
    if (_items.containsKey(id)) {
      if (newQuantity <= 0) {
        removeItem(id);
      } else {
        _items[id]!.quantity = newQuantity;
        notifyListeners();
      }
    }
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}