import 'package:flutter/material.dart';
import 'package:union_shop/part_builder/footer.dart';
import 'package:union_shop/part_builder/main_header.dart';
import 'package:union_shop/part_builder/product_card.dart';
import 'package:union_shop/styles/genral_text.dart';
import 'package:union_shop/logic/realtime_database.dart';

class CollectionProductPage extends StatelessWidget {
  final String itemType;

  CollectionProductPage({
    super.key,
    required this.itemType,
  });
 
  final DatabaseService _databaseService = DatabaseService();

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }
  
  void filterCallBack(int? filter) {
    print(filter);
  }

  /// Get products from Firebase based on itemType
  Future<List<Item>> getProducts() async {
  if (itemType.toLowerCase() == 'sale') {
      return await _databaseService.getSaleItems();
    } else {
      return await _databaseService.getItemsByCategory(itemType);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Item>>(
        future: getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 50),
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text('Error: ${snapshot.error}'),
              ),
            );
          }

          final List<Item> products = snapshot.data ?? [];

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
                      title: item.title,
                      price: item.price,
                      image: item.images,
                      discp: item.discp,
                      newprice: item.newPrice,
                    ),
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