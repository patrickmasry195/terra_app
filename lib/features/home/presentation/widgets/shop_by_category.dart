import 'package:flutter/material.dart';
import 'package:terra_app/features/home/data/datasource/local_data_source.dart';
import 'package:terra_app/features/home/presentation/widgets/category_card.dart';

class ShopByCategory extends StatelessWidget {
  const ShopByCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SHOP BY CATEGORY',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemCount: categories.length - 1,
            itemBuilder: (context, index) {
              final category = categories[index + 1];
              return buildCategoryCard(category);
            },
          ),
        ],
      ),
    );
  }
}
