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
    
  test('CartItem quantity can be updated', () {
      final cartItem = CartItem(
        imageUrl: 'test-image.jpg',
        name: 'Test Product',
        price: '£10.00',
        quantity: 1,
        colour: 'Black',
        size: 'XL',
      );

      cartItem.quantity = 5;
      expect(cartItem.quantity, 5);
      expect(cartItem.getTotalPrice(), 50.0);
    });
  });

group('Cart Tests', () {
    late Cart cart;

    setUp(() {
      cart = Cart();
    });

    test('Cart initializes empty', () {
      expect(cart.items, isEmpty);
      expect(cart.itemCount, 0);
      expect(cart.totalQuantity, 0);
      expect(cart.totalPrice, 0.0);
    });

    test('Cart addItem creates new item', () {
      cart.addItem('item1', 'image.jpg', 'Product 1', '£10.00', 2, 'Red', 'M');

      expect(cart.itemCount, 1);
      expect(cart.totalQuantity, 2);
      expect(cart.totalPrice, 20.0);
      expect(cart.items['item1']?.name, 'Product 1');
      expect(cart.items['item1']?.quantity, 2);
    });

    test('Cart addItem increases quantity for existing item', () {
      cart.addItem('item1', 'image.jpg', 'Product 1', '£10.00', 2, 'Red', 'M');
      cart.addItem('item1', 'image.jpg', 'Product 1', '£10.00', 3, 'Red', 'M');

      expect(cart.itemCount, 1);
      expect(cart.totalQuantity, 5);
      expect(cart.totalPrice, 50.0);
      expect(cart.items['item1']?.quantity, 5);
    });

    test('Cart addItem creates separate items for different IDs', () {
      cart.addItem('item1', 'image1.jpg', 'Product 1', '£10.00', 2, 'Red', 'M');
      cart.addItem('item2', 'image2.jpg', 'Product 2', '£15.00', 1, 'Blue', 'L');

      expect(cart.itemCount, 2);
      expect(cart.totalQuantity, 3);
      expect(cart.totalPrice, 35.0);
    });

    test('Cart updateQuantity removes item when quantity is 0', () {
      cart.addItem('item1', 'image.jpg', 'Product 1', '£10.00', 2, 'Red', 'M');
      cart.updateQuantity('item1', 0);

      expect(cart.itemCount, 0);
      expect(cart.totalQuantity, 0);
      expect(cart.totalPrice, 0.0);
      expect(cart.items['item1'], isNull);
    });

    
  });
}