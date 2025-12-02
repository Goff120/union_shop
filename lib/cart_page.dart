import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/logic/cart.dart';
import 'package:union_shop/part_builder/footer.dart';
import 'package:union_shop/part_builder/main_header.dart';
import 'package:union_shop/styles/genral_text.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
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
            //header end



            const SizedBox(height: 50),
            const Text("your cart", style: genHeader1),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/collection'),
              child: const Text('Continue shopping'),
            ),
            const SizedBox(height: 12),
            Consumer<Cart>(
              builder: (context, cart, child) {
                // cart.items - all items
                // cart.totalPrice - total price
                // cart.totalQuantity - total quantity
                // cart.itemCount - number of different items
                
                return Column(
                  children: cart.items.entries.map((entry) {
                    final item = entry.value;
                    return Text('${item.name} - ${item.price} x ${item.quantity}');
                  }).toList(),
                );
              },
            ),

            const SizedBox(height: 12),
            const Text("add a note to your order", style: genHeader2),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: TextField(
              maxLines: 2,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a note to your order (e.g. delivery instructions)',
                labelText: 'Order note',
              ),
              onChanged: (value) {
              },
              ),
            ),



            // Footer
            const Footer(),
          ],
        ),
      ),
    );
  }
}