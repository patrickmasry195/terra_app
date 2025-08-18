import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final VoidCallback onNext;
  final VoidCallback onPrev;

  const CustomSlider({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onNext,
    required this.onPrev,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: currentPage > 1 ? onPrev : null,
        ),
        Text("$currentPage / $totalPages"),
        IconButton(
          icon: Icon(Icons.chevron_right),
          onPressed: currentPage < totalPages ? onNext : null,
        ),
      ],
    );
  }
}
