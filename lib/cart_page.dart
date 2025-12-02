import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/logic/cart.dart';
import 'package:union_shop/part_builder/cart_product.dart';
import 'package:union_shop/part_builder/footer.dart';
import 'package:union_shop/part_builder/main_header.dart';
import 'package:union_shop/part_builder/styled_button.dart';
import 'package:union_shop/styles/genral_text.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void removeall(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    cart.clear();
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
                return Column(
                  children: cart.items.entries.map((entry) {
                    final productId = entry.key;
                    final item = entry.value;
                    return CartProduct(
                      key: ValueKey(productId),
                      imageUrl: item.imageUrl,
                      title: item.name,
                      price: item.price,
                      quantity: item.quantity,
                      colour: item.colour,
                      size: item.size,
                    );
                  }).toList(),
                );
              },
            ),

            const SizedBox(height: 12),
            const Text("add a note to your order", style: genHeader2),
            const SizedBox(height: 8),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: TextField(
                maxLines: 2,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText:
                      'Add a note to your order (e.g. delivery instructions)',
                  labelText: 'Order note',
                ),
                onChanged: (value) {},
              ),
            ),

            const SizedBox(height: 8),
            Consumer<Cart>(
              builder: (context, cart, child) {
                return Text("Subtotal: £${cart.totalPrice.toStringAsFixed(2)}", style: genHeader2);
              },
            ),
            const SizedBox(height: 8),
            const Text("include Tax and shipping is calculated at checkout", style: genNormal),
            const SizedBox(height: 12),

            StyledButton(
              key: const Key('check_out'),
              onPressed: () => removeall(context),
              label: 'CHECK OUT',
              backgroundColor: const Color.fromARGB(255, 140, 76, 190),
            ),

            const SizedBox(height: 50),

            // Footer
            const Footer(),
          ],
        ),
      ),
    );
  }
}
