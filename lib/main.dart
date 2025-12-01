import 'package:flutter/material.dart';

import 'package:union_shop/about_page.dart';
import 'package:union_shop/collection.dart';
import 'package:union_shop/collection_product_page.dart';



import 'package:union_shop/part_builder/main_header.dart';
import 'package:union_shop/part_builder/footer.dart';
import 'package:union_shop/part_builder/product_card.dart';

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
      initialRoute: '/',
      routes: {
        '/about': (context) => const AboutPage(),
        '/collection': (context) => const CollectionPage(),
      },
      onGenerateRoute: (settings) {
        // Handle routes like /collection/socks, /collection/shirts, etc.
        if (settings.name?.startsWith('/collection/') == true) {
          final itemType = settings.name!.split('/').last;
          return MaterialPageRoute(
            builder: (context) => CollectionProductPage(itemType: itemType),
            settings: settings,
          );
        }
        
        // Return null for unknown routes (will use onUnknownRoute or show error)
        return null;
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
                    image: AssetImage('assets/images/winter sale.webp'),
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
              const SizedBox(height: 12),
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
                    image: "assets/images/jacket.webp",
                    discp: "A thick, cozy warm jacket designed to keep you comfortable in cold weather. Stylish enough for everyday wear, with soft lining and durable material that protects against chilly winds and light rain.",
                    newprice: "F",
                  ),
                  ProductCard(
                    title: 'nice sleek jean',
                    price: '£12.00',
                    image:
                        'assets/images/jeans.webp',
                    discp: "These sleek jeans offer a clean, modern fit perfect for any outfit. Soft, flexible denim gives comfort while keeping a sharp look, making them ideal for casual days or dressed-up evenings.",
                    newprice: "F",
                  ),
                  ProductCard(
                    title: 'well hot hoodie',
                    price: '£20.00',
                    image:
                        'assets/images/well_hot_hoodie.jpeg',
                    discp: "A warm, stylish hoodie built for comfort and personality. Soft on the inside and bold on the outside, it keeps you cozy all day while giving your outfit that perfect relaxed, confident vibe.",
                    newprice: "F",
                  ),
                  ProductCard(
                    title: 'the hot mits',
                    price: '£7.00',
                    image:
                        'assets/images/gloves.webp',
                    discp: "Soft, insulated mitts designed to keep your hands warm in cold weather. Lightweight but protective, they offer comfort, durability, and a simple design that pairs well with any winter outfit.",
                    newprice: "F",
                  ),
                  ProductCard(
                    title: 'silly hat',
                    price: '£7.50',
                    image:
                        'assets/images/hat1.jpeg',
                    discp: "A fun, quirky hat that brings personality to your outfit. Warm, comfortable, and full of charm, it adds a playful twist whether you’re braving the cold or just showing off your unique style.",
                    newprice: "F",
                  ),
                  ProductCard(
                    title: 'rainbow socks',
                    price: '£9.00',
                    image:
                        'assets/images/sock2.jpeg',
                    discp: "Colorful rainbow socks that brighten any outfit. Soft, comfy, and breathable, they're perfect for daily wear and add a cheerful splash of personality every time you slip them on.",
                    newprice: "F",
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

