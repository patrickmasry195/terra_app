import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isSelected;

  const AddButton({super.key, required this.onTap, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    Color baseColor = const Color(0xFFd36d5a);
    Color selectedColor = const Color(0xFFd36d5a);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        width: 46,
        height: 46,
        decoration: BoxDecoration(
          color: isSelected ? baseColor.withOpacity(0.15) : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: isSelected ? selectedColor : baseColor,
            width: 2,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: baseColor.withOpacity(0.6),
                    blurRadius: 10,
                    spreadRadius: 3,
                  ),
                ]
              : [
                  BoxShadow(
                    color: baseColor.withOpacity(0.3),
                    blurRadius: 6,
                    spreadRadius: 1,
                  ),
                ],
        ),
        child: Icon(Icons.add, color: isSelected ? selectedColor : baseColor),
      ),
    );
  }
}
