import 'package:flutter/material.dart';

class ExpandableInfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;
  final bool isExpanded;
  final VoidCallback onTap;

  const ExpandableInfoTile({
    super.key,
    required this.icon,
    required this.title,
    required this.content,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 12.0,
            ),
            child: Row(
              children: [
                Icon(icon, size: 20, color: Colors.black),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  size: 18,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
        if (isExpanded)
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 4.0,
            ),
            child: Text(
              content,
              style: const TextStyle(fontSize: 13, color: Colors.black87),
            ),
          ),
      ],
    );
  }
}
