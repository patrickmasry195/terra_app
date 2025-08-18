import 'package:flutter/material.dart';

class CustomCardItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;

  const CustomCardItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(5),
                ),
                child: Container(
                  height: 300,
                  color: Colors.grey[200],
                  padding: const EdgeInsets.all(1),
                  child: Image.asset(imageUrl, fit: BoxFit.contain),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFFD86E4D),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
              ),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    price,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
