import 'package:flutter/material.dart';
import 'package:union_shop/styles/cart_style.dart';


class CartProduct extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final int quantity;
  final String colour;
  final String size;

  const CartProduct({super.key, 
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.quantity,
    required this.colour,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            children: [
              Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                width: 100,
                height: 50,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(Icons.image_not_supported, color: Colors.grey),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Row 2: price
          Column(
            children: [
              Text(title, style: cartHeader2),
              if (size != "F") ...[
                 Text("size: $size", style: cartNormal), 
              ],
              if (colour != "F") ...[
                 Text("colour: $colour", style: cartNormal), 
              ]
            ],
          ),
          const SizedBox(height: 8),
          
          Column(
            children: [
              Text(price, style: cartHeader2)
            ],
          ),
        ],
      ),
    );
  }
}