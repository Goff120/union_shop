import 'package:flutter/material.dart';



class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  final String discp;
  final String newprice;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.discp,
    required this.newprice
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product/$title');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          SizedBox(
            height: 250, 
            width: 370,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(Icons.image_not_supported, color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 14, color: Colors.black),
            maxLines: 2,
          ),
          const SizedBox(height: 4),
          if (newprice == "F")
            Text(
              price,
              style: const TextStyle(fontSize: 13, color: Colors.grey),
            )
          else
            Row(
              children: [
                Text(
                  newprice,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.red,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}