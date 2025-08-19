import 'package:flutter/material.dart';
import 'package:terra_app/core/widgets/custom_appbar.dart';
import 'package:terra_app/core/widgets/custom_drawer.dart';
import 'package:terra_app/features/home/data/datasource/local_data_source.dart';
import 'package:terra_app/features/home/data/models/product_model.dart';
import '../widget/custom_card_item.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key, required this.category});
  final String category;
  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  String? openDropdown;

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

  int currentPage = 1;
  final int itemsPerPage = 6;

  Widget _buildDropdown(String key, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(key, style: TextStyle(fontSize: key == "Sort by" ? 16 : 12)),
            InkWell(
              child: Image.asset("assets/images/down-arrow.png", height: 20),
              onTap: () {
                setState(() {
                  openDropdown = openDropdown == key ? null : key;
                });
              },
            ),
          ],
        ),
        if (openDropdown == key)
          Container(
            margin: EdgeInsets.only(top: 5),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items
                  .map(
                    (item) => InkWell(
                      onTap: () {
                        setState(() {
                          openDropdown = null;
                        });
                        // Handle selection here
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: Text(
                          item,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
      ],
    );
  }

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
    final startIndex = (currentPage - 1) * itemsPerPage;
    final endIndex = (startIndex + itemsPerPage) > products.length
        ? products.length
        : (startIndex + itemsPerPage);
    final currentItems = products.sublist(startIndex, endIndex);

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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.category,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset("assets/images/filter.png", height: 20),
                    SizedBox(width: 8),
                    Text("Filter", style: TextStyle(fontSize: 16)),
                    SizedBox(width: 8),
                    Expanded(
                      child: _buildDropdown("Availability", availabilityList),
                    ),
                    SizedBox(width: 8),
                    Expanded(child: _buildDropdown("Price", priceList)),
                    SizedBox(width: 8),
                    Expanded(child: _buildDropdown("Sort by", sortByList)),
                  ],
                ),
                SizedBox(height: 20),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: currentItems.length,
                  itemBuilder: (context, index) {
                    return CustomCardItem(title: currentItems[index]);
                  },
                ),
                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: currentPage > 1
                          ? () {
                              setState(() {
                                currentPage--;
                              });
                            }
                          : null,
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    SizedBox(width: 20),
                    Text("$currentPage", style: TextStyle(fontSize: 20)),
                    SizedBox(width: 20),
                    IconButton(
                      onPressed: endIndex < products.length
                          ? () {
                              setState(() {
                                currentPage++;
                              });
                            }
                          : null,
                      icon: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
