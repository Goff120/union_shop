import 'package:flutter/material.dart';
import 'package:union_shop/part_builder/footer.dart';
import 'package:union_shop/part_builder/main_header.dart';
import 'package:union_shop/styles/genral_text.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
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
              child: Column(
                children: [
                  // Top banner
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    color: const Color(0xFF4d2963),
                    child: const Text(
                      'PLACEHOLDER HEADER TEXT',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  // Main header
                  HeaderMain(
                  onHomeTap: () => navigateToHome(context),
                  onSearchTap: placeholderCallbackForButtons,
                  onAccountTap: placeholderCallbackForButtons,
                  onBagTap: placeholderCallbackForButtons,
                  onMenuTap: placeholderCallbackForButtons,
                )
                ],
              ),
            ),

            const Text("About US", style: genHeader1),
            const SizedBox(height: 12),
            const Text("We are the UNI of portsmouth student shop give the best UNI products",
            style: genNormal),
            const SizedBox(height: 6),
            const Text("What we sell!", style: genHeader2),
            const SizedBox(height: 4),
            const Text("""we give a range of items to merch you can 
            be proud of or common useful items that can be the foundation of your learning""",
            style: genNormal),

            const SizedBox(height: 8),
            const Text("""we hope you have a great time in our UNI and can have the proper supplys for it""",
            style: genNormal),

            // Footer
            const Footer(),
          ],
        ),
      ),
    );
  }
}
