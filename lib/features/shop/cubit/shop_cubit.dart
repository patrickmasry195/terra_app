import 'package:flutter_bloc/flutter_bloc.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopInitial());

  String? openDropdown;
  int currentPage = 1;
  final int itemsPerPage = 6;

  final List<String> availabilityList = ['In Stock', 'Out of Stock'];
  final List<String> priceList = ['Price: Low to High', 'Price: High to Low'];
  final List<String> sortByList = [
    'Featured',
    'Best Selling',
    'Alphabetical A-Z',
    'Alphabetical Z-A',
    'Date: New to Old',
    'Date: Old to New',
  ];

  final List<String> products = List.generate(30, (index) => "Product $index");

  void toggleDropdown(String key) {
    openDropdown = openDropdown == key ? null : key;
    emit(ShopDropdownChanged(openDropdown));
  }

  void changePage(int page) {
    currentPage = page;
    emit(ShopPageChanged(currentPage));
  }

  void nextPage() {
    currentPage++;
    emit(ShopPageChanged(currentPage));
  }

  void prevPage() {
    currentPage--;
    emit(ShopPageChanged(currentPage));
  }

  List<String> getCurrentItems() {
    final startIndex = (currentPage - 1) * itemsPerPage;
    final endIndex = (startIndex + itemsPerPage) > products.length
        ? products.length
        : (startIndex + itemsPerPage);
    return products.sublist(startIndex, endIndex);
  }

  int get totalPages => (products.length / itemsPerPage).ceil();
}
