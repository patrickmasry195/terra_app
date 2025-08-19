import '../../../../../core/dummy_data/accessory_model.dart';
import '../models/cart_item_model.dart';


class CartLocalDataSource {
  final List<CartItemModel> _items = [];

  List<CartItemModel> get items => List.unmodifiable(_items);

  void addToCart(AccessoryModel product) {
    final index = _items.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      _items[index] = CartItemModel(product: product, quantity: _items[index].quantity + 1);
    } else {
      _items.add(CartItemModel(product: product));
    }
  }

  void removeFromCart(AccessoryModel product) {
    _items.removeWhere((item) => item.product.id == product.id);
  }

  void increaseQuantity(AccessoryModel product) {
    final index = _items.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      _items[index] = CartItemModel(product: product, quantity: _items[index].quantity + 1);
    }
  }

  void decreaseQuantity(AccessoryModel product) {
    final index = _items.indexWhere((item) => item.product.id == product.id);
    if (index != -1 && _items[index].quantity > 1) {
      _items[index] = CartItemModel(product: product, quantity: _items[index].quantity - 1);
    } else if (index != -1) {
      _items.removeAt(index);
    }
  }

  int get totalItems => _items.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice => _items.fold(0, (sum, item) => sum + item.product.price * item.quantity);
} 