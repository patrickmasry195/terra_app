import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:terra_app/core/utils/app_router.dart';
import 'package:terra_app/core/widgets/custom_appbar.dart';
import 'package:terra_app/core/widgets/custom_drawer.dart';
import 'package:terra_app/features/home/data/datasource/local_data_source.dart';
import 'package:terra_app/features/home/data/models/product_model.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
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
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            Text(
              "Account",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size(0, 0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {
                GoRouter.of(context).go("/");
              },
              label: Text(
                "Log out",
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                ),
              ),
              icon: Icon(Icons.person_2_outlined, color: Colors.black),
            ),
            Text(
              "Order history",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              "You haven't placed any orders yet.",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Account details",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text("John doe", style: TextStyle(fontSize: 16)),
            Text("Egypt", style: TextStyle(fontSize: 16)),
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size(0, 0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kUserAddresses);
              },
              child: Text(
                "View addresses (1)",
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
