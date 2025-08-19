
import 'package:flutter/material.dart';

class CustomCardItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  const CustomCardItem({super.key, required this.title, required this.imageUrl, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffd16147).withOpacity(0.8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                "assets/images/n1.jpg",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "LE 350.00 EGP",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
