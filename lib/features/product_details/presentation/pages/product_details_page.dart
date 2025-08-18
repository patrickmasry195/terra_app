import 'package:flutter/material.dart';
import 'package:terra_app/features/product_details/presentation/widgets/product_details_page_body.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ProductDetailsPageBody());
  }
}
