

import '../../../../../core/dummy_data/accessory.dart';
import '../../../../../core/dummy_data/accessory_model.dart';
import '../../domain/entities/cart_item.dart';
import '../../domain/repositories/cart_repository.dart';
import '../datasources/cart_local_data_source.dart';


class CartRepositoryImpl implements CartRepository {
  final CartLocalDataSource localDataSource;
  CartRepositoryImpl(this.localDataSource);

  @override
  List<CartItem> get items => localDataSource.items.map((model) => model.toEntity()).toList();

  @override
  void addToCart(Accessory accessory) {
    localDataSource.addToCart(AccessoryModel.fromEntity(accessory));
  }

  @override
  void removeFromCart(Accessory accessory) {
    localDataSource.removeFromCart(AccessoryModel.fromEntity(accessory));
  }

  @override
  void increaseQuantity(Accessory accessory) {
    localDataSource.increaseQuantity(AccessoryModel.fromEntity(accessory));
  }

  @override
  void decreaseQuantity(Accessory accessory) {
    localDataSource.decreaseQuantity(AccessoryModel.fromEntity(accessory));
  }

  @override
  int get totalItems => localDataSource.totalItems;

  @override
  double get totalPrice => localDataSource.totalPrice;
} 