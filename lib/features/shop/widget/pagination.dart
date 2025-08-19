
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/shop_cubit.dart';

class Pagination extends StatelessWidget {
  final int totalPages;
  final int currentPage;

  const Pagination({required this.totalPages, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ShopCubit>();
    List<Widget> pages = [];

    if (currentPage > 1) {
      pages.add(
        InkWell(
          onTap: () => cubit.prevPage(),
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
          onTap: () => cubit.changePage(i),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 6),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: i == currentPage
                  ? const Color(0xffd16147).withOpacity(0.8)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: const Color(0xffd16147).withOpacity(0.8),
              ),
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
          onTap: () => cubit.nextPage(),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(">", style: TextStyle(fontSize: 18)),
          ),
        ),
      );
    }

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: pages);
  }
}
