import 'package:flutter/material.dart';
import 'package:union_shop/styles/genral_text.dart';

class StyledButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final Color backgroundColor;

  const StyledButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    ButtonStyle myButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: Colors.white,
      textStyle: genNormal,
    );

    return ElevatedButton(
      onPressed: onPressed,
      style: myButtonStyle,
      child: Center(child: Text(label)),
    );
  }
}