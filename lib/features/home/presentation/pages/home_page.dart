import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:terra_app/core/utils/app_router.dart';
import 'package:terra_app/core/widgets/custom_appbar.dart';
import 'package:terra_app/core/widgets/custom_drawer.dart';
import 'package:terra_app/features/home/data/datasource/local_data_source.dart';
import 'package:terra_app/features/home/presentation/widgets/cover_section.dart';
import 'package:terra_app/features/home/presentation/widgets/italian_charm_bracelets.dart';
import 'package:terra_app/features/home/presentation/widgets/search_data.dart';
import 'package:terra_app/features/home/presentation/widgets/shop_by_category.dart';
import 'package:terra_app/features/home/presentation/widgets/shop_here.dart';
import 'package:terra_app/features/home/presentation/widgets/shop_our_best_seller.dart';
import '../../data/models/product_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  List<Product> _searchResults = [];

  void _performSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        _searchResults = [];
      } else {
        _searchResults = allProducts.where((product) {
          return product.name.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _isSearching
          ? TerraSearchAppBar(
              searchController: _searchController,
              onChanged: _performSearch,
              onClose: () {
                setState(() {
                  _isSearching = false;
                  _searchController.clear();
                  _searchResults = [];
                });
              },
            )
          : TerraNormalAppBar(
              onSearchTap: () {
                setState(() {
                  _isSearching = true;
                });
              },
            ),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CoverSection(),
                  InkWell(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kProductDetailSPage);
                    },
                    child: ItalianCharmBracelets(),
                  ),
                  ShopHere(),
                  ShopByCategory(),
                  ShopOurBestSeller(),
                ],
              ),
            ),
            if (_isSearching) Container(color: Colors.black.withOpacity(0.5)),
            if (_searchController.text.isNotEmpty)
              SearchData(
                searchController: _searchController,
                searchResults: _searchResults,
              ),
          ],
        ),
      ),
    );
  }
}
