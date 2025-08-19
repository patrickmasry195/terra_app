import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:terra_app/core/utils/app_router.dart';
import 'package:terra_app/core/widgets/custom_appbar.dart';
import 'package:terra_app/core/widgets/custom_drawer.dart';
import 'package:terra_app/features/home/data/datasource/local_data_source.dart';
import 'package:terra_app/features/home/data/models/product_model.dart';

class UserAddresses extends StatefulWidget {
  const UserAddresses({super.key});

  @override
  State<UserAddresses> createState() => _UserAddressesState();
}

class _UserAddressesState extends State<UserAddresses> {
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
      body: Column(
        spacing: 20,
        children: [
          SizedBox(height: 40),
          Text(
            "Addresses",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size(0, 0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kUserProfile);
            },
            child: Text(
              "Return to account details",
              style: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: Size(100, 60),

              shape: BeveledRectangleBorder(),
              backgroundColor: Color(0xffd16147),
            ),
            child: Text(
              "Add a new address",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          Text(
            "Default",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text("John Doe", style: TextStyle(fontSize: 16)),
          Text("Egypt", style: TextStyle(fontSize: 16)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  side: const BorderSide(color: Color(0xffd16147)),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Edit",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(width: 16),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Color(0xffd16147)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Delete",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
