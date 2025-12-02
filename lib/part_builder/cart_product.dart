import 'package:flutter/material.dart';
import 'package:union_shop/styles/genral_text.dart';

class CartProduct extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final String price;
  final int quantity;

  const CartProduct({
    super.key,
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            
          ),
          const SizedBox(height: 8),
          // Row 2: price
          Column(
            
          ),
          const SizedBox(height: 8),
          // Row 3: quantity
          const Column(
            children: [
              
            ],
          ),
        ],
      ),
    );
  }
}