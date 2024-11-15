import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String btnText;
  VoidCallback onPressed;

  MyButton({
    super.key,
    required this.btnText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.red[700],
      child: Text(
        btnText,
        style: const TextStyle(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }
}
