import 'package:flutter/material.dart';
import 'package:union_shop/part_builder/footer.dart';
import 'package:union_shop/part_builder/main_header.dart';
import 'package:union_shop/part_builder/product_card.dart';

import 'package:union_shop/styles/genral_text.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

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
            const Text("About US", style: genHeader1),
            const SizedBox(height: 30),

            const ProductCard(
                title: 'warm jacket',
                price: '£30.00',
                image: "assets/jacket.webp",
                discp: "A thick, cozy warm jacket designed to keep you comfortable in cold weather. Stylish enough for everyday wear, with soft lining and durable material that protects against chilly winds and light rain.",
              ),



            
            const Footer(),
          ],
        ),
      ),
    );
  }
}