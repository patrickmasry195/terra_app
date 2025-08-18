import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.controller,
    this.validator,
  });

  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: TextFormField(
        validator: validator,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.zero,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: const Color.fromARGB(255, 201, 195, 195),
            ),
          ),
        ),
      ),
    );
  }
}
