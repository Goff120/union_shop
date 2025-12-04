import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:union_shop/logic/realtime_database.dart';

import 'realtime_database_test.mocks.dart';

@GenerateMocks([DatabaseReference, DataSnapshot])
void main() {
  group('Item Model Tests', () {
    test('Item creates with correct properties', () {
      final item = Item(
        title: 'Test Shirt',
        price: '£25.99',
        images: 'assets/images/test.jpg',
        discp: 'A comfortable test shirt',
        newPrice: '£19.99',
        category: 'shirts',
      );

      expect(item.title, 'Test Shirt');
      expect(item.price, '£25.99');
      expect(item.images, 'assets/images/test.jpg');
      expect(item.discp, 'A comfortable test shirt');
      expect(item.newPrice, '£19.99');
      expect(item.category, 'shirts');
    });

    test('Item.fromJson creates item with valid data', () {
      final json = {
        'title': 'Rainbow Socks',
        'price': '£9.00',
        'image': 'assets/images/sock2.jpeg',
        'discp': 'Colorful rainbow socks',
        'newprice': 'F'
      };

      final item = Item.fromJson(json, 'socks');

      expect(item.title, 'Rainbow Socks');
      expect(item.price, '£9.00');
      expect(item.images, 'assets/images/sock2.jpeg');
      expect(item.discp, 'Colorful rainbow socks');
      expect(item.newPrice, 'F');
      expect(item.category, 'socks');
    });

    test('Item.fromJson handles null and missing values', () {
      final json = <String, dynamic>{
        'title': null,
        'price': null,
        // missing image, discp, newprice
      };

      final item = Item.fromJson(json, 'hats');

      expect(item.title, '');
      expect(item.price, '£0.00');
      expect(item.images, '');
      expect(item.discp, '');
      expect(item.newPrice, 'F');
      expect(item.category, 'hats');
    });

    test('Item.fromJson handles numeric newprice', () {
      final json = {
        'title': 'Test Item',
        'price': '£15.00',
        'image': 'test.jpg',
        'discp': 'Test description',
        'newprice': 12.50
      };

      final item = Item.fromJson(json, 'test');

      expect(item.newPrice, '12.5');
    });
  });

}