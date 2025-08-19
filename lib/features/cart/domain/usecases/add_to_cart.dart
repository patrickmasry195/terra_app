import '../repositories/cart_repository.dart';
import '../../../../../core/dummy_data/accessory.dart';

class AddToCart {
  final CartRepository repository;
  AddToCart(this.repository);

  void call(Accessory accessory) {
    repository.addToCart(accessory);
  }
} 