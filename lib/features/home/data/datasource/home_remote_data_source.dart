import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:terra_app/features/home/data/models/category_model.dart';
import 'package:terra_app/features/home/data/models/product_model.dart';

class HomeRemoteDataSource {
  Future<List<Product>> getBestsellers() async {
    final String response = await rootBundle.loadString(
      'assets/bestsellers.json',
    );
    final List<dynamic> data = jsonDecode(response);
    return data.map((item) => Product.fromJson(item)).toList();
  }

  Future<List<Category>> getCategories() async {
    final String response = await rootBundle.loadString(
      'assets/categories.json',
    );
    final List<dynamic> data = jsonDecode(response);
    return data.map((item) => Category.fromJson(item)).toList();
  }
}
