import 'package:terra_app/features/home/data/models/category_model.dart';
import 'package:terra_app/features/home/domain/repos/home_repo.dart';

class GetCategoriesUseCase {
  final HomeRepository repository;

  GetCategoriesUseCase(this.repository);

  Future<List<Category>> call() async {
    return await repository.getCategories();
  }
}
