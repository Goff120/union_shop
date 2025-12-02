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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            imageUrl,
            fit: BoxFit.cover,
            width: 100,
            height: 100,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 100,
                height: 100,
                color: Colors.grey[300],
                child: const Center(
                  child: Icon(Icons.image_not_supported, color: Colors.grey),
                ),
              );
            },
          ),
          const SizedBox(width: 16),
          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: cartHeader1),
                if (size != "F") ...[
                  Text("Size: $size", style: cartNormal), 
                ],
                if (colour != "F") ...[
                  Text("Colour: $colour", style: cartNormal), 
                ],
              ],
            ),
          ),
          const SizedBox(width: 16),
          
          Text(price, style: cartHeader1),
        ],
      ),

    );
  }
}