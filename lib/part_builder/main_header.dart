import 'package:flutter/material.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 700;

    return Container(
      height: 100,
      color: Colors.white,
      child: Column(
        children: [
          // 🔵 Purple Banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: const Color(0xFF4d2963),
            child: const Text(
              'The one peace! The one peace is REAL!!',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),

          // 🔵 Main Navigation Row
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  // 🔵 Logo
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/');
                    },
                    child: Image.network(
                      'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                      height: 28,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          width: 28,
                          height: 28,
                          child: const Icon(Icons.image_not_supported,
                              color: Colors.grey),
                        );
                      },
                    ),
                  ),

                  const Spacer(),

                  // 🔵 DESKTOP NAVIGATION LINKS
                  if (!isMobile) ...[
                    _navItem(context, "Home", "/"),
                    _navItem(context, "Products", "/products"),
                    _navItem(context, "About", "/about"),
                    _navItem(context, "Contact", "/contact"),
                    const SizedBox(width: 24),
                  ],

                  // 🔵 MOBILE MENU BUTTON
                  if (isMobile)
                    IconButton(
                      icon: const Icon(Icons.menu, size: 24),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Reusable desktop nav item widget
  Widget _navItem(BuildContext context, String label, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(route);
        },
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}