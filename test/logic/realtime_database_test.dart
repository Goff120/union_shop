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

  group('DatabaseService Tests', () {
    late MockDatabaseReference mockDatabaseRef;
    late MockDataSnapshot mockSnapshot;

    setUp(() {
      mockDatabaseRef = MockDatabaseReference();
      mockSnapshot = MockDataSnapshot();
    });

}



Future<List<Item>> _getItemsByCategoryWithMock(MockDatabaseReference mockRef, String category) async {
  final snapshot = await mockRef.get();
  
  if (!snapshot.exists) return [];
  
  List<Item> items = [];
  final data = snapshot.value as List<dynamic>;
  
  for (var item in data) {
    if (item != null) {
      items.add(Item.fromJson(
        Map<String, dynamic>.from(item),
        category,
      ));
    }
  }
  return items;
}

Future<Map<String, List<Item>>> _getAllItemsWithMock(MockDatabaseReference mockRef) async {
  final snapshot = await mockRef.get();
  
  if (!snapshot.exists) return {};
  
  Map<String, List<Item>> allItems = {};
  final data = snapshot.value as Map<dynamic, dynamic>;
  
  data.forEach((category, items) {
    List<Item> itemList = [];
    
    if (items is List) {
      for (var item in items) {
        if (item != null) {
          itemList.add(Item.fromJson(
            Map<String, dynamic>.from(item),
            category.toString(),
          ));
        }
      }
    }
    
    allItems[category.toString()] = itemList;
  });
  
  return allItems;
}

List<Item> _extractSaleItems(Map<String, List<Item>> allItems) {
  List<Item> saleItems = [];
  
  allItems.forEach((category, items) {
    for (var item in items) {
      if (item.newPrice != 'F' && item.newPrice != 'false') {
        saleItems.add(item);
      }
    }
  });
  
  return saleItems;
}

Map<String, String> _getFirstImageInCategory(Map<String, List<Item>> allItems) {
  Map<String, String> categoryImages = {};
  
  allItems.forEach((category, items) {
    for (final item in items) {
      if (item.images.isNotEmpty) {
        categoryImages[category] = item.images;
        break; 
      }
    }
  });
  
  return categoryImages;
}

Future<Item?> _getItemByTitleWithMock(MockDatabaseReference mockRef, String title) async {
  final snapshot = await mockRef.get();
  if (!snapshot.exists) return null;

  final data = snapshot.value;
  if (data is! Map) return null;

  final search = title.toString().toLowerCase().trim();

  for (final categoryEntry in data.entries) {
    final category = categoryEntry.key;
    final items = categoryEntry.value;

    if (items is List) {
      for (final item in items) {
        if (item == null) continue;
        if (item is Map) {
          final itemTitle = (item['title'] ?? item['Title'] ?? '').toString().toLowerCase().trim();
          if (itemTitle == search) {
            return Item.fromJson(Map<String, dynamic>.from(item), category.toString());
          }
        }
      }
    }
  }

  return null;
}