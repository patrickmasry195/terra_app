import '../../../../../core/dummy_data/accessory.dart';
import '../entities/cart_item.dart';


abstract class CartRepository {
  List<CartItem> get items;
  void addToCart(Accessory accessory);
  void removeFromCart(Accessory accessory);
  void increaseQuantity(Accessory accessory);
  void decreaseQuantity(Accessory accessory);
  int get totalItems;
  double get totalPrice;
} 