import 'package:flutter/material.dart';
import '../widget/custom_card_item.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

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
            Text(key, style: TextStyle(fontSize: key == "Sort by" ? 18 : 16)),
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

  Widget _buildPagination(int totalPages) {
    List<Widget> pages = [];

    if (currentPage > 1) {
      pages.add(
        InkWell(
          onTap: () {
            setState(() {
              currentPage--;
            });
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text("<", style: TextStyle(fontSize: 18)),
          ),
        ),
      );
    }

    for (int i = 1; i <= totalPages; i++) {
      pages.add(
        InkWell(
          onTap: () {
            setState(() {
              currentPage = i;
            });
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 6),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: i == currentPage
                  ? Color(0xffd16147).withOpacity(0.8)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Color(0xffd16147).withOpacity(0.8)),
            ),
            child: Text(
              "$i",
              style: TextStyle(
                color: i == currentPage ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }

    if (currentPage < totalPages) {
      pages.add(
        InkWell(
          onTap: () {
            setState(() {
              currentPage++;
            });
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(">", style: TextStyle(fontSize: 18)),
          ),
        ),
      );
    }

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: pages);
  }

  @override
  Widget build(BuildContext context) {
    final startIndex = (currentPage - 1) * itemsPerPage;
    final endIndex = (startIndex + itemsPerPage) > products.length
        ? products.length
        : (startIndex + itemsPerPage);
    final currentItems = products.sublist(startIndex, endIndex);

    final totalPages = (products.length / itemsPerPage).ceil();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Necklaces",
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
              _buildPagination(totalPages), 
            ],
          ),
        ),
      ),
    );
  }
}
