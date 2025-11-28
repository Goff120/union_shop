import 'package:flutter/material.dart';
import 'package:union_shop/part_builder/collection_imagedart';
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
                imageUrl: 'sock3.jpeg',
                text: 'SOCKS',
                routeName: '/socks',
                width: 350,
                height: 250,
              ),
              CollectionImage(
                imageUrl: 'well_hot_hoodie.jpeg',
                text: 'Winter Sales',
                routeName: '/winter-collection',
                width: 350,
                height: 250,
              ),
              CollectionImage(
                imageUrl: 'shirt1.jpeg',
                text: 'shirts',
                routeName: '/shirts',
                width: 350,
                height: 250,
              ),
              CollectionImage(
                imageUrl: 'hat1.jpeg',
                text: 'hats',
                routeName: '/hats',
                width: 350,
                height: 250,
              ),
              CollectionImage(
                imageUrl: 'trousers1.jpeg',
                text: 'trousers',
                routeName: '/trousers',
                width: 350,
                height: 250,
              ),
              CollectionImage(
                imageUrl: 'hoodie1.jpeg',
                text: 'hoodie',
                routeName: '/hoodie',
                width: 350,
                height: 250,
              ),
              CollectionImage(
                imageUrl: 'pen1.jpeg',
                text: 'get the must haves',
                routeName: '/must_have',
                width: 350,
                height: 250,
              ),
              CollectionImage(
                imageUrl: 'merch1.jpeg',
                text: 'merch',
                routeName: '/merch',
                width: 350,
                height: 250,
              ),
              CollectionImage(
                imageUrl: 'pride1.jpeg',
                text: 'our pride',
                routeName: '/pride',
                width: 350,
                height: 250,
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