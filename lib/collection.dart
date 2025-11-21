import 'package:flutter/material.dart';
import 'package:union_shop/part_builder/footer.dart';
import 'package:union_shop/part_builder/main_header.dart';
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
            const Text("Collection", style: genHeader1),
            const SizedBox(height: 30),
            
            // Footer
            const Footer(),
          ],
        ),
      ),
    );
  }
}