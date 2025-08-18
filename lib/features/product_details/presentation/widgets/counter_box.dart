import 'package:flutter/material.dart';

class CounterBox extends StatelessWidget {
  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CounterBox({
    super.key,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.zero,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: onDecrement,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text("$value", style: const TextStyle(fontSize: 18)),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: onIncrement,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}
