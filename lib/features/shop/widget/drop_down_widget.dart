import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/shop_cubit.dart';

class DropdownWidget extends StatelessWidget {
  final String title;
  final List<String> items;
  final String? openDropdown;

  const DropdownWidget({
    required this.title,
    required this.items,
    required this.openDropdown,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ShopCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: title == "Sort by" ? 17 : 15),
            ),
            InkWell(
              child: Image.asset("assets/images/down-arrow.png", height: 17),
              onTap: () => cubit.toggleDropdown(title),
            ),
          ],
        ),
        if (openDropdown == title)
          Container(
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items
                  .map(
                    (item) => InkWell(
                      onTap: () => cubit.toggleDropdown(""),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: Text(
                          item,
                          style: const TextStyle(
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
}
