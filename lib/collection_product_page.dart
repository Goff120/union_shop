import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:union_shop/part_builder/footer.dart';
import 'package:union_shop/part_builder/main_header.dart';
import 'package:union_shop/part_builder/product_card.dart';
import 'package:union_shop/styles/genral_text.dart';

class CollectionProductPage extends StatelessWidget {
  final String itemType;

  const CollectionProductPage({
    super.key,
    required this.itemType,
  });

  /// Load entire JSON file
  Future<Map<String, dynamic>> loadItems() async {
    final jsonString = await rootBundle.loadString('assets/json/items.json');
    return jsonDecode(jsonString) as Map<String, dynamic>;
  }

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }
  
  void filterCallBack(int? filter) {
    print(filter);
  }

  /// Get products based on itemType
  /// If itemType is "sale", collect all items with newprice != "F"
  List<dynamic> getProducts(Map<String, dynamic> allItems) {
    if (itemType.toLowerCase() == 'sale') {
      List<dynamic> saleItems = [];
      
      // Loop through all categories
      allItems.forEach((category, items) {
        if (items is List) {
          // Filter items that have a sale price (newprice != "F")
          for (var item in items) {
            if (item['newprice'] != null && item['newprice'] != 'F' && item['newprice'] != false) {
              saleItems.add(item);
            }
          }
        }
      });
      
      return saleItems;
    } else {
      // Return items from specific category
      return allItems[itemType] ?? [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>>(
        future: loadItems(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 50),
                child: CircularProgressIndicator(),
              ),
            );
          }

          final allItems = snapshot.data!;
          final List<dynamic> products = getProducts(allItems);

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Header section
                Container(
                  height: 100,
                  color: Colors.white,
                  child: const Column(
                    children: [
                      MainHeader(),
                    ],
                  ),
                ),
                //end of header

                //title
                const SizedBox(height: 50),
                Text(itemType.toUpperCase(), style: genHeader1),

                if (itemType.toLowerCase() == "sale") ...[
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      '🔥 Limited Time Offers🔥',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Don't miss out on these exclusive deals!",
                      style: genNormal,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
                const SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: DropdownButton(
                        key: const Key('filter_dropdown'),
                        hint: const Text("filter by", style: genHeader2),
                        items: const [
                          DropdownMenuItem(
                          value: 1,
                          child: Text("all products"),
                          ),
                          DropdownMenuItem(
                          value: 2,
                          child: Text("clothes"),
                          ),
                          DropdownMenuItem(
                          value: 3,
                          child: Text("merch"),
                          ),
                          DropdownMenuItem(
                          value: 4,
                          child: Text("popular"),
                          ),
                          DropdownMenuItem(
                          value: 5,
                          child: Text("popular"),
                          ),
                        ],
                        onChanged: filterCallBack,
                        isExpanded: true,
                        underline: Container(height: 2, color: Colors.black),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: DropdownButton(
                        key: const Key('sort_dropdown'),
                        hint: const Text("sort by", style: genHeader2),
                        items: const [
                          DropdownMenuItem(
                          value: 1,
                          child: Text("price: low to high"),
                          ),
                          DropdownMenuItem(
                          value: 2,
                          child: Text("price: high to low"),
                          ),
                          DropdownMenuItem(
                          value: 3,
                          child: Text("newest first"),
                          ),
                          DropdownMenuItem(
                          value: 4,
                          child: Text("best sellers"),
                          ),
                          DropdownMenuItem(
                          value: 5,
                          child: Text("ratings"),
                          ),
                        ],
                        onChanged: filterCallBack,
                        isExpanded: true,
                        underline: Container(height: 2, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),

                // Product Grid
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                  children: products.map((item) {
                    return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: ProductCard(
                      title: item['title'],
                      price: item['price'],
                      image: item['image'],
                      discp: item['discp'],
                      newprice: item['newprice'] == false ? "F" : item['newprice'].toString(),
                    ),
                    );
                  }
                    
                    ).toList(),
                  ),
                ),

                //start of footer
                const SizedBox(height: 50),
                const Footer(),
              ],
            ),
          );
        },
      ),
    );
  }
}