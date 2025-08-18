import 'package:terra_app/features/home/data/datasource/home_remote_data_source.dart';
import 'package:terra_app/features/home/data/models/category_model.dart';
import 'package:terra_app/features/home/data/models/product_model.dart';
import 'package:terra_app/features/home/domain/repos/home_repo.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Product>> getBestsellers() {
    return remoteDataSource.getBestsellers();
  }

  @override
  Future<List<Category>> getCategories() {
    return remoteDataSource.getCategories();
  }
}
