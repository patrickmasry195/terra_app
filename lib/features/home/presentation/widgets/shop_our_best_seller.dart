import 'package:flutter/material.dart';
import 'package:terra_app/features/home/data/datasource/local_data_source.dart';
import 'package:terra_app/features/home/presentation/widgets/best_seller_card.dart';

class ShopOurBestSeller extends StatelessWidget {
  const ShopOurBestSeller({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'SHOP OUR BESTSELLERS',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'View all',
                  style: TextStyle(
                    color: Colors.grey,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: bestsellers.map((product) {
                return buildBestsellerCard(product);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
