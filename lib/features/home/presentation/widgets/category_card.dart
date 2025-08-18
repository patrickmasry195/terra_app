import 'package:flutter/material.dart';
import 'package:terra_app/features/home/data/models/category_model.dart';

Widget buildCategoryCard(Category category) {
  return Container(
    height: 250, // أضف ارتفاعًا ثابتًا
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
              category.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Wrap(
            spacing: 10,
            runSpacing: 5,
            children: [
              Text(
                category.name.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.arrow_forward, color: Colors.white),
            ],
          ),
        ),
      ],
    ),
  );
}
