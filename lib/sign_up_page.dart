import 'package:flutter/material.dart';
import 'package:union_shop/part_builder/styled_button.dart';


import 'package:union_shop/styles/genral_text.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void _shopCallback() {
    //none function shop
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
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
            const SizedBox(height: 60),
            
            // Sign up form box
            Center(
              child: Container(
                width: 400,
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Sign Up', style: genHeader1),
                    const SizedBox(height: 24),
                    const Text("choose how you would like to sign up", style: genNormal),
                    const SizedBox(height: 5),

                    StyledButton(
                      key: const Key('shop'),
                      onPressed: _shopCallback,
                      label: 'Sign in with Shop',
                      backgroundColor: const Color.fromARGB(255, 64, 117, 221),
                    ),
                    const SizedBox(height: 5),
                    const SizedBox(height: 5),
                    const Center(
                      child: Text("------------ or ------------", style: genNormal),
                    ),
                    const SizedBox(height: 5),
                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}