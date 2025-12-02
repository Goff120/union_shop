import 'package:flutter/material.dart';
import 'package:union_shop/part_builder/collection_image.dart';
import 'package:union_shop/part_builder/footer.dart';
import 'package:union_shop/part_builder/main_header.dart';
import 'package:union_shop/styles/genral_text.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            const SizedBox(height: 50),
            const Text("Collection", style: genHeader1),
            const SizedBox(height: 30),
            const Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: [
              CollectionImage(
                imageUrl: 'assets/images/sock3.jpeg',
                text: 'SOCKS',
                routeName: 'socks',

              ),
              CollectionImage(
                imageUrl: 'assets/images/well_hot_hoodie.jpeg',
                text: 'Winter Sales',
                routeName: 'Winter Sales',

              ),
              CollectionImage(
                imageUrl: 'assets/images/shirt1.jpeg',
                text: 'shirts',
                routeName: 'shirts',

              ),
              CollectionImage(
                imageUrl: 'assets/images/hat1.jpeg',
                text: 'hats',
                routeName: 'hats',

              ),
              CollectionImage(
                imageUrl: 'assets/images/trousers1.jpeg',
                text: 'trousers',
                routeName: 'trousers',

              ),
              CollectionImage(
                imageUrl: 'assets/images/hoodie1.jpeg',
                text: 'hoodie',
                routeName: 'hoodie',

              ),
              CollectionImage(
                imageUrl: 'assets/images/pen1.jpeg',
                text: 'get the must haves',
                routeName: 'get the must haves',

              ),
              CollectionImage(
                imageUrl: 'assets/images/merch1.jpeg',
                text: 'merch',
                routeName: 'merch',

              ),
              CollectionImage(
                imageUrl: 'assets/images/pride1.jpeg',
                text: 'our pride',
                routeName: 'pride',

              ),

              ],
            ),
            const SizedBox(height: 12),
            // Footer
            const Footer(),
          ],
        ),
      ),
    );
  }
}