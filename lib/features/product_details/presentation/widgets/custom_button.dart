import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final bool hasBorder;
  final TextStyle? style;
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
    required this.hasBorder,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 120),
      decoration: BoxDecoration(
        color: color,
        border: hasBorder ? Border.all(color: Colors.black, width: 1.0) : null,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 24.0,
            ),
            child: Text(text, textAlign: TextAlign.center, style: style),
          ),
        ),
      ),
    );
  }
}
