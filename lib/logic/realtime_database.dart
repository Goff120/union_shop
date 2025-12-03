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

  // Get all items from Firebase (matches items.json structure)
  Future<Map<String, List<Item>>> getAllItems() async {
    final snapshot = await _database.child('items').get();
    
    if (!snapshot.exists) return {};
    
    Map<String, List<Item>> allItems = {};
    final data = snapshot.value as Map<dynamic, dynamic>;
    
    // Loop through categories: SOCKS, shirts, hats, hoodie, etc.
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

  
  
}