import 'package:flutter/material.dart';

import 'package:union_shop/about_page.dart';
import 'package:union_shop/collection.dart';
import 'package:union_shop/product_page.dart';

import 'package:union_shop/part_builder/main_header.dart';
import 'package:union_shop/part_builder/footer.dart';
import 'package:union_shop/part_builder/productCard.dart';

void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
      ),
      home: const HomeScreen(),
      // By default, the app starts at the '/' route, which is the HomeScreen
      initialRoute: '/',
      // When navigating to '/product', build and return the ProductPage
      // In your browser, try this link: http://localhost:49856/#/product
      routes: {
        '/product': (context) => const ProductPage(),
        // About route - create AboutPage widget (e.g. lib/about_page.dart) and import it above
        '/about': (context) => const AboutPage(),
        '/collection': (context) => const CollectionPage(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void navigateToProduct(BuildContext context) {
    Navigator.pushNamed(context, '/product');
  }

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  void navigatetocollection(BuildContext context) {
    Navigator.pushNamed(context, '/collection');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
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

      // Hero Section
      SizedBox(
        height: 400,
        width: double.infinity,
        child: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/winter sale.webp'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ),
            ),
            // Content overlay
            Positioned(
              left: 24,
              right: 24,
              top: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Union Shop',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "WE have our no cold sale 20% off",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () => navigatetocollection(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4d2963),
                      foregroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: const Text(
                      'WE LOVE OUR PRODUCTS',
                      style: TextStyle(fontSize: 14, letterSpacing: 1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Products Section
      Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              const Text(
                'PRODUCTS SECTION',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 48),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
                crossAxisSpacing: 24,
                mainAxisSpacing: 48,
                children: const [
                  ProductCard(
                    title: 'warm jacket',
                    price: '£30.00',
                    image: "assets/jacket.webp",
                  ),
                  ProductCard(
                    title: 'nice sleek jean',
                    price: '£12.00',
                    image:
                        'jeans.webp',
                  ),
                  ProductCard(
                    title: 'well hot hoodie',
                    price: '£20.00',
                    image:
                        'assets/well_hot_hoodie.jpeg',
                  ),
                  ProductCard(
                    title: 'the hot mits',
                    price: '£7.00',
                    image:
                        'assets/gloves.webp',
                  ),
                  ProductCard(
                    title: 'silly hat',
                    price: '£7.50',
                    image:
                        'hat1.jpeg',
                  ),
                  ProductCard(
                    title: 'rainbow socks',
                    price: '£9.00',
                    image:
                        'sock2.jpeg',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      // Footer
      const Footer(),
    ])));
  }
}

