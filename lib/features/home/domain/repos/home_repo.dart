import 'package:terra_app/features/home/data/models/category_model.dart';
import 'package:terra_app/features/home/data/models/product_model.dart';

abstract class HomeRepository {
  Future<List<Product>> getBestsellers();
  Future<List<Category>> getCategories();
}
