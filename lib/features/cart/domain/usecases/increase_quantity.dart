import '../repositories/cart_repository.dart';
import '../../../../../core/dummy_data/accessory.dart';

class IncreaseQuantity {
  final CartRepository repository;
  IncreaseQuantity(this.repository);

  void call(Accessory accessory) {
    repository.increaseQuantity(accessory);
  }
} 