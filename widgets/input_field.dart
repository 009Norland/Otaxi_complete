import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final bool obscureText; 
  final TextEditingController
  controller; 
  final IconData? icon; 

  const InputField({
    Key? key,
    required this.hintText,
    this.obscureText = false,
    required this.controller,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller, 
      obscureText: obscureText, 
      decoration: InputDecoration(
        hintText: hintText, 
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
        fillColor: Colors.white,
        filled: true,
        prefixIcon:
            icon != null
                ? Icon(icon)
                : null, 
      ),
    );
  }
}
