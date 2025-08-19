import 'package:flutter/material.dart';
import 'package:terra_app/core/injections.dart';
import 'package:terra_app/features/auth/presentation/pages/login_page.dart';
import 'package:terra_app/features/auth/presentation/pages/signup_page.dart';
import 'package:terra_app/features/home/presentation/pages/home_page.dart';
import 'package:terra_app/features/product_details/presentation/pages/product_details_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
