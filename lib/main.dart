import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:union_shop/about_page.dart';
import 'package:union_shop/cart_page.dart';
import 'package:union_shop/collection.dart';
import 'package:union_shop/collection_product_page.dart';
import 'package:union_shop/logic/cart.dart';
import 'package:union_shop/logic/realtime_database.dart';



import 'package:union_shop/part_builder/main_header.dart';
import 'package:union_shop/part_builder/footer.dart';
import 'package:union_shop/part_builder/product_card.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => Cart(),
      child: const UnionShopApp(),
    ),
  );
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
        '/sale': (context) =>  CollectionProductPage(
          itemType: "sale"
          ),
        '/cart' : (context) => const CartPage(),
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

        return null;
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DatabaseService _databaseService = DatabaseService();

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
              FutureBuilder<List<Item>>(
                future: _databaseService.getSaleItems(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(40.0),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Text('Error: ${snapshot.error}'),
                      ),
                    );
                  }

                  final products = snapshot.data ?? [];

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 48,
                    ),
                    itemCount: products.length > 6 ? 6 : products.length,
                    itemBuilder: (context, index) {
                      final item = products[index];
                      return ProductCard(
                        title: item.title,
                        price: item.price,
                        image: item.images,
                        discp: item.discp,
                        newprice: item.newPrice,
                      );
                    },
                  );
                },
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


