import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:union_shop/part_builder/footer.dart';
import 'package:union_shop/part_builder/main_header.dart';
import 'package:union_shop/part_builder/product_card.dart';
import 'package:union_shop/styles/genral_text.dart';

class CollectionProductPage extends StatelessWidget {
  final String itemType;

  const CollectionProductPage(String s, {
    super.key,
    required this.itemType,
  });

  /// Load entire JSON file
  Future<Map<String, dynamic>> loadItems() async {
    final jsonString = await rootBundle.loadString('assets/items.json');
    return jsonDecode(jsonString) as Map<String, dynamic>;
  }

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
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
          final List<dynamic> products = allItems[itemType] ?? [];

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

                const SizedBox(height: 50),
                Text(itemType.toUpperCase(), style: genHeader1),
                const SizedBox(height: 30),

                // Product Grid
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: products.map((item) {
                      return ProductCard(
                        title: item['title'],
                        price: item['price'],
                        image: item['image'],
                        discp: item['discp'],
                      );
                    }).toList(),
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