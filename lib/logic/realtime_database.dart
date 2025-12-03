import 'package:firebase_database/firebase_database.dart';

class Item {
final String title;
final String price;
final String images;
final String discp;
final String newPrice;
final String category;


Item({
required this.title,
required this.price,
required this.images,
required this.discp,
required this.newPrice,
required this.category,
});

factory Item.fromJson(Map<String, dynamic> json, String category) {
    return Item(
      title: json['title']?? '',
      price: json['price']?? '£0.00',
      images: json['image']?? '',
      discp: json['discp']?? '',
      newPrice: json['newprice']?.toString() ?? 'F',
      category: category,
    );
  }

}

class DatabaseService {
  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  

  // Get items from specific category
  Future<List<Item>> getItemsByCategory(String category) async {
    final snapshot = await _database.child('items/$category').get();
    
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

  // Get all items from Firebase 
  Future<Map<String, List<Item>>> getAllItems() async {
    final snapshot = await _database.child('items').get();
    
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

  //get all items on sale
  Future<List<Item>> getSaleItems() async {
    final allItems = await getAllItems();
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

  //get first image in each category as a map
  Future<Map<String, String>> getFirstImageInCategory() async {
    final allItems = await getAllItems();
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

Future<Item?> getItemByTitle(String title) async {
    final snapshot = await _database.child('items').get();
    if (!snapshot.exists) return null;

    final data = snapshot.value;
    if (data is! Map) return null;

    final search = title.toString().toLowerCase().trim();

    for (final categoryEntry in data.entries) {
      final category = categoryEntry.key;
      final items = categoryEntry.value;

      // handle list-stored items
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
}