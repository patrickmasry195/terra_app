import 'package:flutter/material.dart';
import 'package:terra_app/features/home/data/models/product_model.dart';

Widget buildSearchResultItem(Product product) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(product.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 15),
        Text(
          product.name,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Color(0xFFD36C5B),
          ),
        ),
      ],
    ),
  );
}
