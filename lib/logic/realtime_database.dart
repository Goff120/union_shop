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

