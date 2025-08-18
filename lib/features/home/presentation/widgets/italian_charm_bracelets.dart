import 'package:flutter/material.dart';
import 'package:terra_app/features/home/data/datasource/local_data_source.dart';
import 'package:terra_app/features/home/presentation/widgets/best_seller_card.dart';
import 'package:terra_app/features/home/presentation/widgets/category_card.dart';


class ItalianCharmBracelets extends StatelessWidget {
  const ItalianCharmBracelets({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Italian charm bracelets!',
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
            itemCount: 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                final bestseller = bestsellers[0];
                return buildBestsellerCard(bestseller);
              } else {
                final category = categories[0];
                return buildCategoryCard(category);
              }
            },
          ),
        ],
      ),
    );
  }
}
