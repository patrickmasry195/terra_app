import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/dummy_data/accessory.dart';
import '../../../../../core/injections.dart';
import '../../domain/entities/cart_item.dart';
import '../../domain/repositories/cart_repository.dart';
import '../../domain/usecases/add_to_cart.dart';
import '../../domain/usecases/decrease_quantity.dart';
import '../../domain/usecases/increase_quantity.dart';
import '../../domain/usecases/remove_from_cart.dart';


class CartState extends Equatable {
  final List<CartItem> items;
  final int totalItems;
  final double totalPrice;
  const CartState({required this.items, required this.totalItems, required this.totalPrice});
  
  @override
  List<Object?> get props => [items , totalItems , totalPrice];
}

class CartCubit extends Cubit<CartState> {
  final AddToCart addToCartUsecase = AddToCart(sl<CartRepository>());
  final RemoveFromCart removeFromCartUsecase = RemoveFromCart(sl<CartRepository>());
  final IncreaseQuantity increaseQuantityUsecase =  IncreaseQuantity(sl<CartRepository>());
  final DecreaseQuantity decreaseQuantityUsecase =  DecreaseQuantity(sl<CartRepository>());

  CartCubit() : super(CartState(items: [], totalItems: 0, totalPrice: 0));

  void addToCart(Accessory accessory) {
    addToCartUsecase(accessory);
    _refreshCart();
  }

  void removeFromCart(Accessory accessory) {
    removeFromCartUsecase(accessory);
    _refreshCart();
  }

  void increaseQuantity(Accessory accessory) {
    increaseQuantityUsecase(accessory);
    _refreshCart();
  }

  void decreaseQuantity(Accessory accessory) {
    decreaseQuantityUsecase(accessory);
    _refreshCart();
  }

  void _refreshCart() {
   final repo = sl<CartRepository>();
   emit(
      CartState(
        items: repo.items, 
        totalItems: repo.totalItems, 
        totalPrice: repo.totalPrice
      )
    );
  }
} 