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
            const Text("We are the UNI of portsmouth student shop give the best UNI products",
            style: genNormal),
            const SizedBox(height: 15),
            const Text("What we sell!", style: genHeader2),
            const SizedBox(height: 8),
            const Text("""we give a range of items to merch you can 
be proud of or common useful items that can be the foundation of your learning""",
            style: genNormal),

            const SizedBox(height: 20),
            const Text("""we hope you have a great time in our UNI and can have the proper supplys for it""",
            style: genNormal),
            const SizedBox(height: 20),
            // Footer
            const Footer(),
          ],
        ),
      ),
    );
  }
}
