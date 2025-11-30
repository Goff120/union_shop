import 'package:flutter/material.dart';
import 'package:union_shop/part_builder/footer.dart';
import 'package:union_shop/part_builder/main_header.dart';
import 'package:union_shop/part_builder/styled_button.dart';
import 'package:union_shop/styles/genral_text.dart';

class ProductPage extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String discp;

  const ProductPage({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.discp,
  }) : super(key: key);

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void sizeCallBack(int? size) {
    print(size);
  }

  void colourCallBack(int? colour) {
    print(colour);
  }

  void addToCart() {
    print("ADD to cart"); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              height: 100,
              color: Colors.white,
              child: const Column(
                children: [
                  //header
                  MainHeader()
                ],
              ),
            ),

            // Product details
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product image
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[200],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            child: const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.image_not_supported,
                                    size: 64,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Image unavailable',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Product name
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Product price
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4d2963),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Product description
                  const Text('Description', style: genHeader2),
                  const SizedBox(height: 8),
                  Text(discp, style: genNormal),
                  const SizedBox(height: 14),
                  const Text('Purchase', style: genHeader2),

                  const SizedBox(height: 5),
                    DropdownButton(
                    hint: const Text("Select Colour", style: genHeader2),
                    items: const [
                      DropdownMenuItem(
                      value: 1,
                      child: Text("Blue"),
                      ),
                      DropdownMenuItem(
                      value: 2,
                      child: Text("Red"),
                      ),
                      DropdownMenuItem(
                      value: 3,
                      child: Text("Purple"),
                      ),
                    ],
                    onChanged: sizeCallBack,
                    isExpanded: true,
                    underline: Container(height: 3, color: Colors.black),
                    ),

                    const SizedBox(height: 12),
                    Row(
                    children: [
                      Expanded(
                      child: DropdownButton(
                        hint: const Text("Select Size", style: genHeader2),
                        items: const [
                        DropdownMenuItem(
                          value: 1,
                          child: Text("Small"),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text("Medium"),
                        ),
                        DropdownMenuItem(
                          value: 3,
                          child: Text("Large"),
                        ),
                        DropdownMenuItem(
                          value: 4,
                          child: Text("XLarge"),
                        ),
                        ],
                        onChanged: sizeCallBack,
                        isExpanded: true,
                        underline: Container(height: 2, color: Colors.black),
                      ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter amount',
                          ),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 12),
                StyledButton(
                key: const Key('add_to_cart_button'),
                onPressed: addToCart,
                label: 'Add to Cart',
                backgroundColor: const Color.fromARGB(255, 140, 76, 190),
              ),
              const SizedBox(height: 12),
                ],
              ),
            ),

            // Footer
            const Footer(),
          ],
        ),
      ),
    );
  }
}
