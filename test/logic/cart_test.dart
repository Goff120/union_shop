import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/logic/cart.dart';

void main() {
  group('CartItem Tests', () {
    test('CartItem creates with correct properties', () {
      final cartItem = CartItem(
        imageUrl: 'test-image.jpg',
        name: 'Test Product',
        price: '£25.99',
        quantity: 2,
        colour: 'Red',
        size: 'M',
      );

      expect(cartItem.imageUrl, 'test-image.jpg');
      expect(cartItem.name, 'Test Product');
      expect(cartItem.price, '£25.99');
      expect(cartItem.quantity, 2);
      expect(cartItem.colour, 'Red');
      expect(cartItem.size, 'M');
    });

        test('CartItem toMap converts to correct format', () {
      final cartItem = CartItem(
        imageUrl: 'test-image.jpg',
        name: 'Test Product',
        price: '£25.99',
        quantity: 2,
        colour: 'Red',
        size: 'M',
      );

      final map = cartItem.toMap();

      expect(map, {
        'imageUrl': 'test-image.jpg',
        'name': 'Test Product',
        'price': '£25.99',
        'quantity': 2,
      });
    });

    test('CartItem getTotalPrice calculates correctly with £ symbol', () {
      final cartItem = CartItem(
        imageUrl: 'test-image.jpg',
        name: 'Test Product',
        price: '£25.99',
        quantity: 2,
        colour: 'Red',
        size: 'M',
      );

      expect(cartItem.getTotalPrice(), 51.98);
    });

    test('CartItem getTotalPrice calculates correctly without £ symbol', () {
      final cartItem = CartItem(
        imageUrl: 'test-image.jpg',
        name: 'Test Product',
        price: '25.99',
        quantity: 3,
        colour: 'Blue',
        size: 'L',
      );

      expect(cartItem.getTotalPrice(), 77.97);
    });

    test('CartItem getTotalPrice handles invalid price', () {
      final cartItem = CartItem(
        imageUrl: 'test-image.jpg',
        name: 'Test Product',
        price: 'invalid',
        quantity: 2,
        colour: 'Green',
        size: 'S',
      );

      expect(cartItem.getTotalPrice(), 0.0);
    });

  });
}
