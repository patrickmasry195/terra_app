import '../repositories/cart_repository.dart';
import '../../../../../core/dummy_data/accessory.dart';

class RemoveFromCart {
  final CartRepository repository;
  RemoveFromCart(this.repository);

  void call(Accessory accessory) {
    repository.removeFromCart(accessory);
  }
} 