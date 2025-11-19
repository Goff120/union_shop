import 'package:flutter/material.dart';

class HeaderMain extends StatelessWidget {
  final VoidCallback onHomeTap;
  final VoidCallback onSearchTap;
  final VoidCallback onAccountTap;
  final VoidCallback onBagTap;
  final VoidCallback onMenuTap;

  const HeaderMain({
    super.key,
    required this.onHomeTap,
    required this.onSearchTap,
    required this.onAccountTap,
    required this.onBagTap,
    required this.onMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            GestureDetector(
              onTap: onHomeTap,
              child: Image.network(
                'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                height: 18,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    width: 18,
                    height: 18,
                    child: const Center(
                      child: Icon(Icons.image_not_supported,
                          color: Colors.grey),
                    ),
                  );
                },
              ),
            ),

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
                    onPressed: onAccountTap,
                  ),
                  IconButton(
                    icon: const Icon(Icons.shopping_bag_outlined,
                        size: 18, color: Colors.grey),
                    padding: const EdgeInsets.all(8),
                    constraints: const BoxConstraints(
                      minWidth: 32,
                      minHeight: 32,
                    ),
                    onPressed: onBagTap,
                  ),
                  IconButton(
                    icon: const Icon(Icons.menu,
                        size: 18, color: Colors.grey),
                    padding: const EdgeInsets.all(8),
                    constraints: const BoxConstraints(
                      minWidth: 32,
                      minHeight: 32,
                    ),
                    onPressed: onMenuTap,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}