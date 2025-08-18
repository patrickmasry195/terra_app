import 'package:flutter/material.dart';
import 'package:terra_app/features/home/presentation/widgets/search_result_item.dart';

class SearchData extends StatelessWidget {
  const SearchData({
    super.key,
    required this.searchController,
    required this.searchResults,
  });

  final searchController;
  final searchResults;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Container(
              color: Color(0xFFFADCD6),
              padding: EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (searchResults.isNotEmpty)
                    Text(
                      'PRODUCTS',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD36C5B),
                      ),
                    ),
                  SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      final product = searchResults[index];
                      return buildSearchResultItem(product);
                    },
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Search for '${searchController.text}'",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFD36C5B),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Color(0xFFD36C5B)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
