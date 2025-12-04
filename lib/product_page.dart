import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/logic/cart.dart';
import 'package:union_shop/logic/realtime_database.dart';
import 'package:union_shop/part_builder/footer.dart';
import 'package:union_shop/part_builder/main_header.dart';
import 'package:union_shop/part_builder/styled_button.dart';
import 'package:union_shop/styles/genral_text.dart';

class ProductPage extends StatefulWidget {
  final String title;

  const ProductPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final Map<String, dynamic> selections = {};
  final TextEditingController quantityController = TextEditingController();
  final DatabaseService _dbService = DatabaseService();
  
  String? selectedColour;
  String? selectedSize;
  Item? _item;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    selectedColour = 'Blue';
    selectedSize = 'M';
    selections['colour'] = selectedColour;
    selections['size'] = selectedSize;
    _loadItem();
  }

  Future<void> _loadItem() async {
    try {
      final item = await _dbService.getItemByTitle(widget.title);
      setState(() {
        _item = item;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void colourCallBack(String? selection) {
    setState(() {
      selectedColour = selection;
      selections['colour'] = selection;
    });
  }

  void sizeCallBack2(String? selection) {
    setState(() {
      selectedSize = selection;
      selections['size'] = selection;
    });
  }

  void addToCart(BuildContext context) {
    if (_item == null) return;
    
    final cart = Provider.of<Cart>(context, listen: false);
    final quantity = int.tryParse(quantityController.text) ?? 1;
    
    // Get colour and size with fallback to "F" if not selected
    final colour = selections['colour']?.toString() ?? 'F';
    final size = selections['size']?.toString() ?? 'F';
    
    // Create a unique ID based on title and selections
    final id = '${widget.title}-$colour-$size';
    
    cart.addItem(id, _item!.images, _item!.title, _item!.price, quantity, colour, size);
    
    // Show confirmation
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Added $quantity x ${widget.title} to cart'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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

            // Product details
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product image
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[200],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        widget.image,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            child: const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.image_not_supported,
                                    size: 64,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Image unavailable',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Product name
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Product price
                  Text(
                    widget.price,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4d2963),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Product description
                  const Text('Description', style: genHeader2),
                  const SizedBox(height: 8),
                  Text(widget.discp, style: genNormal),
                  const SizedBox(height: 14),
                  const Text('Purchase', style: genHeader2),

                  const SizedBox(height: 5),
                    DropdownButton<String>(
                    key: const Key('colour_dropdown'),
                    value: selectedColour,
                    hint: const Text("Select Colour", style: genHeader2),
                    items: const [
                      DropdownMenuItem(
                      value: "Blue",
                      child: Text("Blue"),
                      ),
                      DropdownMenuItem(
                      value: "Red",
                      child: Text("Red"),
                      ),
                      DropdownMenuItem(
                      value: "Purple",
                      child: Text("Purple"),
                      ),
                    ],
                    onChanged: colourCallBack,
                    isExpanded: true,
                    underline: Container(height: 3, color: Colors.black),
                    ),

                    const SizedBox(height: 12),
                    Row(
                    children: [
                      Expanded(
                      child: DropdownButton<String>(
                        key: const Key('size_dropdown'),
                        value: selectedSize,
                        hint: const Text("Select Size", style: genHeader2),
                        items: const [
                        DropdownMenuItem(
                          value: "S",
                          child: Text("Small"),
                        ),
                        DropdownMenuItem(
                          value: "M",
                          child: Text("Medium"),
                        ),
                        DropdownMenuItem(
                          value: "L",
                          child: Text("Large"),
                        ),
                        DropdownMenuItem(
                          value: "XL",
                          child: Text("XLarge"),
                        ),
                        ],
                        onChanged: sizeCallBack2,
                        isExpanded: true,
                        underline: Container(height: 2, color: Colors.black),
                      ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          controller: quantityController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter amount',
                          ),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 12),
                StyledButton(
                  key: const Key('add_to_cart_button'),
                  onPressed: () => addToCart(context),
                  label: 'Add to Cart',
                  backgroundColor: const Color.fromARGB(255, 140, 76, 190),
                ),
                const SizedBox(height: 12),
                
                // Show cart count
                Consumer<Cart>(
                  builder: (context, cart, child) {
                    return Text(
                      'Items in cart: ${cart.totalQuantity}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              const SizedBox(height: 12),
                ],
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
