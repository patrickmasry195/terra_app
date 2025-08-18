import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:terra_app/core/utils/app_router.dart';
import 'package:terra_app/features/home/data/datasource/local_data_source.dart';
import 'package:terra_app/features/home/presentation/widgets/cover_section.dart';
import 'package:terra_app/features/home/presentation/widgets/home_drawer.dart';
import 'package:terra_app/features/home/presentation/widgets/italian_charm_bracelets.dart';
import 'package:terra_app/features/home/presentation/widgets/search_data.dart';
import 'package:terra_app/features/home/presentation/widgets/shop_by_category.dart';
import 'package:terra_app/features/home/presentation/widgets/shop_here.dart';
import 'package:terra_app/features/home/presentation/widgets/shop_our_best_seller.dart';
import 'package:terra_app/features/product_details/presentation/pages/product_details_page.dart';

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
      appBar: _isSearching ? _buildSearchAppBar() : _buildNormalAppBar(),
      drawer: HomeDrawer(),
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

  AppBar _buildNormalAppBar() {
    return AppBar(
      iconTheme: IconThemeData(color: Color(0xFFD36C5B)),
      backgroundColor: Color(0xFFFADCD6),
      elevation: 0,
      title: Text(
        'TERRA',
        style: TextStyle(
          color: Color(0xFFD36C5B),
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            setState(() {
              _isSearching = true;
            });
          },
        ),
        IconButton(icon: Icon(Icons.shopping_bag_outlined), onPressed: () {}),
      ],
    );
  }

  AppBar _buildSearchAppBar() {
    return AppBar(
      iconTheme: IconThemeData(color: Color(0xFFD36C5B)),
      backgroundColor: Color(0xFFFADCD6),
      elevation: 0,
      title: SizedBox(
        height: 45,
        child: TextField(
          cursorColor: Color(0xFFD36C5B),
          controller: _searchController,
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.search, color: Color(0xFFD36C5B)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(color: Colors.white),
            ),
            labelText: 'Search',
            labelStyle: TextStyle(color: Color(0xFFD36C5B), fontSize: 12),
          ),
          onChanged: _performSearch,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            setState(() {
              _isSearching = false;
              _searchController.clear();
              _searchResults = [];
            });
          },
        ),
      ],
    );
  }
}
