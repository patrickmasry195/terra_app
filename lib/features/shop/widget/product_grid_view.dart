import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:terra_app/features/shop/widget/custom_card_item.dart';

import '../../../core/utils/app_router.dart';

class productGridView extends StatelessWidget {
  const productGridView({super.key, required this.currentItems});
  final List<String> currentItems;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kProductDetailSPage);
      },
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemCount: currentItems.length,
        itemBuilder: (context, index) {
          return CustomCardItem(
            title: currentItems[index],
            imageUrl: "assets/images/n1.jpg",
            price: "LE 350.00 EGP",
          );
        },
      ),
    );
  }
}
