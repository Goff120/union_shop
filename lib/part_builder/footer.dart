import 'package:flutter/material.dart';
import 'package:union_shop/styles/footer_style.dart';
import 'package:url_launcher/url_launcher.dart';


class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color.fromARGB(255, 219, 219, 219),
      padding: const EdgeInsets.all(24),
      child: Column(
        children: <Widget>[
          const Text('Open hours', style: footHeader1),
          const SizedBox(height: 4),
          const Text('Term time', style: footHeader2),
          const SizedBox(height: 4),
          const Text('Monday-Friday(07:30-19:00)', style: footNormal),
          const Text('Out of term or reading week', style: footHeader2),
          const SizedBox(height: 4),
          const Text('Monday-Thursday(09:00-15:00)', style: footNormal),
          const SizedBox(height: 4),
          const Text('24/7 in store', style: footNormal),
          const SizedBox(height: 32),

          InkWell(
            child: const Text(
              "help me",
              style: footerlink,
            ),
            onTap: () async {
              final url = Uri.parse("https://www.google.com/");
              await launchUrl(url);
            },
          )
        ],
      ),
    );
  }
}