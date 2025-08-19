
import '../../../../../core/dummy_data/accessory_model.dart';
import '../../domain/entities/cart_item.dart';

class CartItemModel {
  final AccessoryModel product;
  final int quantity;

  CartItemModel({required this.product, this.quantity = 1});

  factory CartItemModel.fromEntity(CartItem cartItem) => CartItemModel(
        product: AccessoryModel.fromEntity(cartItem.accessory),
        quantity: cartItem.quantity,
      );

  CartItem toEntity() => CartItem(
        accessory: product.toEntity(),
        quantity: quantity,
      );
} 