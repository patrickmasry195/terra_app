import 'package:flutter/material.dart';
import 'package:terra_app/features/home/data/models/product_model.dart';

Widget buildBestsellerCard(Product product) {
  return Container(
    width: 160,
    height: 280,
    margin: EdgeInsets.only(right: 15),
    decoration: BoxDecoration(
      color: Color(0xFFD36C5B),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: [
        // هنا يمكنك استخدام Expanded بأمان الآن
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                product.name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'LE ${product.price.toStringAsFixed(2)} EGP',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
