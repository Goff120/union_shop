import 'package:flutter/material.dart';
import 'package:union_shop/part_builder/collection_image.dart';
import 'package:union_shop/part_builder/footer.dart';
import 'package:union_shop/part_builder/main_header.dart';
import 'package:union_shop/styles/genral_text.dart';
import 'package:union_shop/logic/realtime_database.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  final DatabaseService _databaseService = DatabaseService();

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

            FutureBuilder<Map<String, String>>(
              future: _databaseService.getFirstImageInCategory(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                
                final categoryImages = snapshot.data ?? {};
                
                return Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: categoryImages.entries.map((entry) {
                    return CollectionImage(
                      imageUrl: entry.value,
                      text: entry.key,
                    );
                  }).toList(),
                );
              },
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