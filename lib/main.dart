import 'package:flutter/material.dart';
import 'package:terra_app/features/auth/presentation/pages/login_page.dart';
import 'package:terra_app/features/product_details/presentation/pages/product_details_page.dart';
import 'package:terra_app/features/shop/pages/shop_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: ShopScreen());
  }
}
