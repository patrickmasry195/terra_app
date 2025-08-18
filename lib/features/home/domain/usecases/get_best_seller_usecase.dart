import 'package:terra_app/features/home/data/models/product_model.dart';
import 'package:terra_app/features/home/domain/repos/home_repo.dart';

class GetBestsellersUseCase {
  final HomeRepository repository;

  GetBestsellersUseCase(this.repository);

  Future<List<Product>> call() async {
    return await repository.getBestsellers();
  }
}
