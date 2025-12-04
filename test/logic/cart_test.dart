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

  });
}
