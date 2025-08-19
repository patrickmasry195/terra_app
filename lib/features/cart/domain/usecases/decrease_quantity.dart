import '../repositories/cart_repository.dart';
import '../../../../../core/dummy_data/accessory.dart';

class DecreaseQuantity {
  final CartRepository repository;
  DecreaseQuantity(this.repository);

  void call(Accessory accessory) {
    repository.decreaseQuantity(accessory);
  }
} 