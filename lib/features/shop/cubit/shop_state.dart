part of 'shop_cubit.dart';

abstract class ShopState {}

class ShopInitial extends ShopState {}

class ShopDropdownChanged extends ShopState {
  final String? openDropdown;
  ShopDropdownChanged(this.openDropdown);
}

class ShopPageChanged extends ShopState {
  final int currentPage;
  ShopPageChanged(this.currentPage);
}
