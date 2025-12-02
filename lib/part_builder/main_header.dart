import 'package:flutter/material.dart';
import 'package:union_shop/cart_page.dart';
import 'package:union_shop/sign_up_page.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({super.key});

  void onSearchTap() {
    // This is the event handler for buttons that don't work yet
  }

  void onAccountTap(BuildContext context) {
    Navigator.of(context).push(
    MaterialPageRoute<void>(
      builder: (context) => const SignUpPage(),
    ),
  );
  }

  void onBagTap(BuildContext context) {
    Navigator.of(context).push(
    MaterialPageRoute<void>(
      builder: (context) => const CartPage(),
    ),
  );
  }

    void onMenuTap(BuildContext context) async {
    final selection = await showMenu<String>(
      context: context,
      position: const RelativeRect.fromLTRB(1000, 80, 16, 0), 
      items: const [
        PopupMenuItem(value: '/', child: Text('Home')),
        PopupMenuItem(value: '/collection', child: Text('Collection')),
        PopupMenuItem(value: '/print-shack', child: Text('The Print Shack')),
        PopupMenuItem(value: '/sale', child: Text('Sale!')),
        PopupMenuItem(value: '/about', child: Text('About')),
      ],
    );

    if (selection != null) {
      Navigator.of(context).pushNamed(selection);
    }
  }
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
                    _navItem(context, "collection", "/collection"),
                    _navItem(context, "About", "/about"),
                    _navItem(context, "Sale!", "/sale"),
                    const SizedBox(width: 24),
                  ],

                  const Spacer(),

                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.search,
                              size: 18, color: Colors.grey),
                          padding: const EdgeInsets.all(8),
                          constraints: const BoxConstraints(
                            minWidth: 32,
                            minHeight: 32,
                          ),
                          onPressed: onSearchTap,
                        ),
                        IconButton(
                          icon: const Icon(Icons.person_outline,
                              size: 18, color: Colors.grey),
                          padding: const EdgeInsets.all(8),
                          constraints: const BoxConstraints(
                            minWidth: 32,
                            minHeight: 32,
                          ),
                          onPressed: () => onAccountTap(context),
                        ),
                        IconButton(
                          icon: const Icon(Icons.shopping_bag_outlined,
                              size: 18, color: Colors.grey),
                          padding: const EdgeInsets.all(8),
                          constraints: const BoxConstraints(
                            minWidth: 32,
                            minHeight: 32,
                          ),
                          onPressed: () => onBagTap(context),
                        ),
                        if (isMobile) 
                        IconButton(
                          icon: const Icon(Icons.menu,
                              size: 18, color: Colors.grey),
                          padding: const EdgeInsets.all(8),
                          constraints: const BoxConstraints(
                            minWidth: 32,
                            minHeight: 32,
                          ),
                          onPressed: () => onMenuTap(context),
                        ),
                      ],
                    ),
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